(* 5.9.3 Catch-all Cases *)

(*Write function and color varients*)
type color = Blue | Red | Green
let string_of_color = function
| Blue -> "blue"
| _ -> "red";;

string_of_color Blue;;
string_of_color Green;;(*The problem is the catch-all case in the pattern match inside string_of_color: the final case that uses the wildcard pattern to match anything.*)
(**better way *)
(* let string_of_color = function
| Blue -> "blue"
| Red -> "red";; *)

(*5.9.4 Recursive Varients*)
(* Define a type 'intlist' that represents a list of integers *)
type intlist = Nil | Cons of int * intlist
(* Create a list 'lst3' containing a single element 3 *)
let lst3 = Cons (3, Nil) (* similar to 3 :: [] or [3] *)

(* Create a list 'lst123' containing elements 1, 2, and 3 *)
let lst123 = Cons(1, Cons(2, lst3)) (* similar to [1; 2; 3] *)

(* Define a recursive function 'sum' that calculates the sum of elements in the list *)
let rec sum1 (l : intlist) : int =
  match l with
  | Nil -> 0
  | Cons (h, t) -> h + sum1 t;;
sum1 lst123;;
sum1(Cons(1, Cons(2, Cons(3, Cons(4,Nil)))));;

(* Define a recursive function 'length' that calculates the length of the list *)
let rec length : intlist -> int = function
  | Nil -> 0
  | Cons (_, t) -> 1 + length t

(* Define a function 'empty' that checks if the list is empty *)
let empty : intlist -> bool = function
  | Nil -> true
  | Cons _ -> false;;

  (* Types may be mutually recursive if you use the and keyword: *)
(* Define a record type 'node' with fields 'value' of type int and 'next' of type mylist *)
type node = {value: int; next: mylist}
(* Define a variant type 'mylist' that can either be 'Nil' or 'Node' containing a 'node' *)
and mylist = Nil | Node of node;;

(** type t = u and u = t *) (*gives error*)
type t = U of u and u = T of t

(* Record types may also be recursive: *)
type node = {value : int; next : node};;
(** type t = t*t;; *) (*Error: The type abbreviation t is cyclic*)



(*5.9.5. Parameterized Variants : Variant types may be parameterized on other type*)
(* Define a custom list type 'a mylist *)
type 'a mylist = Nil | Cons of 'a * 'a mylist
(* Create a list containing the integer 3, similar to [3] in traditional lists *)
let lst3 = Cons (3, Nil)
(* Create a list containing the string "hi", similar to ["hi"] in traditional lists *)
let lst_hi = Cons ("hi", Nil)

(* Here are some functions over 'a mylist: *)
let rec length : 'a mylist -> int = function
| Nil -> 0
| Cons (_, t) -> 1 + length t
let empty : 'a mylist -> bool = function
| Nil -> true
| Cons _ -> false
(* give up some polymorphism. For example, *)
let rec sum = function
| Nil -> 0
| Cons (h, t) -> h + sum t

(* It is also possible to have multiple type parameters for a parameterized type, in which case parentheses are needed: *)
type ('a, 'b) pair = {first : 'a; second : 'b}
let x = {first = 2; second = "hello"}



(* 5.9.6 Polymorphic Variants :  simply returns its input*)
(* define a variant type, you have had to give it a name, such as day, shape, or 'a mylist: *)
type day = Sun | Mon | Tue | Wed | Thu | Fri | Sat
type point = float * float
type shape =
  | Point of point
  | Circle of point * float
  | Rect of point * point;;

type 'a mylist = Nil | Cons of 'a * 'a mylist;;

(* define a variant type to represent that result: *)
(* Define a type fin_or_inf with two possible variants:*)
type fin_or_inf = Finite of int | Infinity
let f = function
  | 0 -> `Infinity   (* If the input is 0, return Infinity *)
  | 1 -> `Finite 1   (* If the input is 1, return Finite 1 *)
  | n -> `Finite (-n);; (* For any other input n, return Finite (-n) *)
  (* For example, wecould write: *)
match f 3 with
  | `NegInfinity -> "negative infinity"
  | `Finite n -> "finite"
  | `Infinity -> "infinite";;

  (* 5.9.7 Built-in Variants *)
  (* OCaml’s built-in list data type is really a recursive, parameterized variant. It is defined as follows: *)
type 'a list = [] | ( :: ) of 'a * 'a list
(* OCaml’s built-in option data type is also really a parameterized variant. It’s defined as follows: *)
type 'a option = None | Some of 'a