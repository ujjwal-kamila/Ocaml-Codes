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

