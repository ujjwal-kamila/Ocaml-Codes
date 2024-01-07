(* 5.1.6. Immediate Matches *)

let rec sum lst =
  match lst with
  | [] -> 0
  | h :: t -> h + sum t;;
  sum [1;5;9];;


  let rec sum = function
  | [] -> 0
  | h :: t -> h + sum t;;

  (*from video "use 'function' "*)
  let empty = function
  | [] -> true
  | _ -> false;;

  let rec sum = function
    |[] -> 0 
    |h :: t -> h + sum t;;

(*for length*)
let rec length = function 
 |[] -> 0
 | h::t -> 1 + length t;;
 (*for append it is not possible*)