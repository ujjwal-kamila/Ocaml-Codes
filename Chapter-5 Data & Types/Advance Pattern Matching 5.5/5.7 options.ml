(* 5.7 Options : Suppose you want to write a function that usually returns a value of type t *)
(* define a function list_max that returns the maximum value in a list, but there’s not a sensible thing to return on an empty list: *)

(** 
let rec list_max = function
| [] -> ???
| h :: t -> max h (list_max t);; *)

