(* 5.1.6. Immediate Matches *)

let rec sum lst =
  match lst with
  | [] -> 0
  | h :: t -> h + sum t;;
  sum [1;5;9];;


  let rec sum = function
| [] -> 0
| h :: t -> h + sum t;;