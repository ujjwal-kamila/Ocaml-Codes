let rec sum = function
| [] -> 1 (* bug *)
| x :: xs -> x + sum xs







(* 
let rec sum = function
| [] -> 0
| x :: xs -> x + sum xs;; *)