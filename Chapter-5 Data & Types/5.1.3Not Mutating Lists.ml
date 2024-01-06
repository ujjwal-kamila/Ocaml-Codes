(* 5.1.3Not Mutating Lists *)

(* Lists are immutable. There’s no way to change an element of a list from one value to another *)
let inc_first lst =
  match lst with
  | [] -> []
  | h :: t -> h + 1 :: t;;

  (* 5.1.4 Pattern Matching with Lists *)
  (* Syntax  :
match e with
| p1 -> e1
| p2 -> e2
| ...
| pn -> en
*)

(* Pattern matching involves two inter-related tasks *)
  match 1 :: [] with
| [] -> false
| h :: t -> h >= 1 && List.length t = 0;;
