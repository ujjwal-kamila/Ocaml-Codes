(* 5.1.3Not Mutating Lists *)

(* Lists are immutable. There’s no way to change an element of a list from one value to another *)
let inc_first lst =
  match lst with
  | [] -> []
  | h :: t -> h + 1 :: t;;

  (* 5.1.4 Pattern Matching with Lists *)
  (* Syntax.
  match e
  | p1 ->
  | p2 ->
  | ...
  | pn ->
  with
  e1
  e2
  en *)

