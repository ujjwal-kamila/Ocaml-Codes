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




(** [from i j l] is the list containing the integers from [i] to [j],
    inclusive, followed by the list [l].
    Example:  [from 1 3 [0] = [1; 2; 3; 0]] *)
    let rec from i j l = if i > j then l else from i (j - 1) (j :: l)

    (** [i -- j] is the list containing the integers from [i] to [j], inclusive. *)
    let ( -- ) i j = from i j []
    
    let long_list = 0 -- 1_000_000;;