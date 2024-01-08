(* 5.1.9. Tail Recursion *)

(* Def : A function is tail recursive if it calls itself recursively but does not perform any computation after the recursive call returns, and immediately returns to its caller the value of its recursive call *)

  let rec sum (l : int list) : int =
    match l with
    | [] -> 0
    | x :: xs -> x + (sum xs);; (*If the list is not empty, add the first element 'x' to the sum of the rest of the list 'xs' *)
    sum ([1;2;3]);;

let rec sum_plus_acc (acc : int) (l : int list) : int =
  match l with
  | [] -> acc
  | x :: xs -> sum_plus_acc (acc + x) xs;; (*  (* Recursive case: add current element to accumulator and recurse on the rest of the list *)
  *)
  sum_plus_acc 0 [1;2;3;4];;

  let sum_tr : int list -> int =
    sum_plus_acc 0;;(* Calls a function sum_plus_acc with an initial accumulator value of 0 *)
    sum_plus_acc 0 [1;2;3;4];;