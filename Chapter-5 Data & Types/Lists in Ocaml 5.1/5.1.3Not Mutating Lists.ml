(* 5.1.3Not Mutating Lists *)

(* Lists are immutable. There’s no way to change an element of a list from one value to another *)
let inc_first lst =
  match lst with
  | [] -> []
  | h :: t -> h + 1 :: t;;

