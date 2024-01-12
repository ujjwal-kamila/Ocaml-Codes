let rec sum = function
| [] -> 1 (* bug *)
| x :: xs -> x + sum xs;;