(* A structure is simply a collection of definitions, such as below code*)

(* struct
  let inc x = x + 1
  type primary_color = Red | Green | Blue
  exception Oops
end *)

module MyModule = struct
  let inc x = x + 1
  type primary_color = Red | Green | Blue
  exception Oops
end
(*
sig
  val inc : int -> int
  type primary_color = Red | Green | Blue
  exception Oops
end   
*)


module ListStack = struct
  (** [empty] is the empty stack. *)
  let empty = []

  (** [is_empty s] is whether [s] is empty. *)
  let is_empty = function [] -> true | _ -> false

  (** [push x s] pushes [x] onto the top of [s]. *)
  let push x s = x :: s

  (** [Empty] is raised when an operation cannot be applied
      to an empty stack. *)
  exception Empty

  (** [peek s] is the top element of [s].
      Raises [Empty] if [s] is empty. *)
  let peek = function
    | [] -> raise Empty
    | x :: _ -> x

  (** [pop s] is all but the top element of [s].
      Raises [Empty] if [s] is empty. *)
  let pop = function
    | [] -> raise Empty
    | _ :: s -> s
end;;


ListStack.push 2 (ListStack.push 1 ListStack.empty);;
ListStack.(push 2 (push 1 empty));;
ListStack.(empty |> push 1 |> push 2);;

let s1 = ListStack.(empty |> push 1 |> push 2);;
let s2 = ListStack.(empty |> push 3);;

(* 7.2.1. Module Definitions *)

(* common syntax :  for a module definition is simply: *)
(* module ModuleName = struct
  module_items
end;; *)

(* But a more accurate version of the syntax would be:

module ModuleName = module_expression *)

(**The definitions inside a structure can optionally be terminated by ;; as in the toplevel: *)
module M = struct
  let x = 0;
  type t = int;;
end

(* One use case for ;; is if you want to evaluate an expression as part of a module: *)
  module M = struct
    let x = 0;;
    assert (x = 0);;
  end

(* also can be written as  *)
module M = struct
  let x = 0
  let _ = assert (x = 0)
end


(* Structures can also be written on a single line, with optional ;; between items for readability: *)
module E = struct end

(* let definition of x is being evaluated, y has not yet been bound: *)
(*Unbound value y Error : 
 module M = struct
  let x = y
  let y = 0
end
 *)


  (* Scope  *)
  module M = struct let x = 42 end;;
  M.x;;

  (*or we can use*)
  (*
   open M
    x;; 
  *)
(* To uppercase the  *)
  module M = struct
    open List
  
    (** [uppercase_all lst] upper-cases all the elements of [lst]. *)
    let uppercase_all = map String.uppercase_ascii
  end


  (* remove surrounding whitespace from [s] and convert it to lower case *)
let s = "  BigRed  "
let s' = s |> String.trim |> String.lowercase_ascii (* long way *)
let s'' = String.(s |> trim |> lowercase_ascii) (* short way *)

(* lower trim to remove spaces *)
(** [lower_trim s] is [s] in lower case with whitespace removed. *)
let lower_trim s =
  let open String in
  s |> trim |> lowercase_ascii;;

lower_trim " hiii ";;

(*All uppercase*)
module M = struct
  (** [uppercase_all lst] upper-cases all the elements of [lst]. *)
  let uppercase_all = List.map String.uppercase_ascii
end;;

M.uppercase_all ["ujjwal";"kamila"];;


(* 5.2.3. Module Type Definitions *)
(* a module type for our list-based stacks: *)
module type LIST_STACK = sig
  exception Empty
  val empty : 'a list
  val is_empty : 'a list -> bool
  val push : 'a -> 'a list -> 'a list
  val peek : 'a list -> 'a
  val pop : 'a list -> 'a list
end

(*Module List Stack  *)
module type LIST_STACK = sig
  (** [Empty] is raised when an operation cannot be applied
      to an empty stack. *)
  exception Empty

  (** [empty] is the empty stack. *)
  val empty : 'a list

  (** [is_empty s] is whether [s] is empty. *)
  val is_empty : 'a list -> bool

  (** [push x s] pushes [x] onto the top of [s]. *)
  val push : 'a -> 'a list -> 'a list

  (** [peek s] is the top element of [s].
      Raises [Empty] if [s] is empty. *)
  val peek : 'a list -> 'a

  (** [pop s] is all but the top element of [s].
      Raises [Empty] if [s] is empty. *)
  val pop : 'a list -> 'a list
end

module ListStack = struct
  let empty = []

  let is_empty = function [] -> true | _ -> false

  let push x s = x :: s

  exception Empty

  let peek = function
    | [] -> raise Empty
    | x :: _ -> x

  let pop = function
    | [] -> raise Empty
    | _ :: s -> s
end;;


(* We can add a type annotation in the first line of the module definition: *)
module ListStack : LIST_STACK = struct
  let empty = []
  let is_empty = function [] -> true | _ -> false
  let push x s = x :: s
  exception Empty

  let peek = function
    | [] -> raise Empty
    | x :: _ -> x

  let pop = function
    | [] -> raise Empty
    | _ :: s -> s
end

(* Here are a few examples to show how that syntax can be used: *)

module ListStackAlias : LIST_STACK = ListStack
(* equivalently *)
module ListStackAlias = (ListStack : LIST_STACK)

module M : sig val x : int end = struct let x = 42 end
(* equivalently *)
module M = (struct let x = 42 end : sig val x : int end)

(* And, module types can include nested module specifications: *)
module type X = sig
  val x : int
end

module type T = sig
  module Inner : X
end

module M : T = struct
  module Inner : X = struct
    let x = 42
  end
end


(* 7.2.4. Module Type Semantics *)

(* The “sub” vs. “super” in the second rule is not a typo. Consider these module types and modules: *)

module type T = sig
  val a : int
end

module type S = sig
  val a : int
  val b : bool
end

module A = struct
  let a = 0
end

module AB = struct
  let a = 0
  let b = true
end

module AC = struct
  let a = 0
  let c = 'c'
end