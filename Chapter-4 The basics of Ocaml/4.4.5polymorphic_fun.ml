(**4.4.5 Polymorphic Function "It is a Function that simply returns its input type"*)
let id x = x;;

id 42;;
id true;;
id "bigred";;
(**  It simply returns its input type*)
let id' : 'a -> 'a = fun x -> x + 1;;
let id_int' : int -> int = id;;

let id' : 'a -> 'a = fun x -> x + 1;;

(**Restrictive type to a polymorphic function : Examples*)
let id_int (x : int) : int = x;;
let id_int' : int -> int =id;;

id_int true;; (**Type error*)
id' true;;  (**Type error*)

let first x y = x;;
let first_int : int -> 'b -> int = first;;
(* let bad_first : int -> 'b -> string = first;;    this is not a valid string *) 