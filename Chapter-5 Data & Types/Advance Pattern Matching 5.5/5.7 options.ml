(* 5.7 Options : Suppose you want to write a function that usually returns a value of type t *)
(* define a function list_max that returns the maximum value in a list, but there’s not a sensible thing to return on an empty list: *)

(** 
let rec list_max = function
 | [] -> ???
 | h :: t -> max h (list_max t);;   gives syntax error *)

let rec list_max = function
 | [] -> 0
 | h :: t -> max h (list_max t);;

 (*Create an option that is like a box with 42 inside it:*)
Some 42;;
(* And here’s how we create an option that is like an empty box: *)
None;;

(*We can acess the contends of an options value 'e' using pattern matching : like below*)
(*In Below here is a fun that extracts an int from an option if there is one inside, and converts it to an string *)
let extract o =   (*takes option type as argument*)
  match o with   
  |Some i -> string_of_int i  (*returns str of int*)
  |None -> "";;           (*returns empty str when None*)
  extract (Some 42);;
  extract None;;


