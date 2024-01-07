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
  match 1 :: [] with (*to match the list 1 ::[].*)
| [] -> false           
| h :: t -> h >= 1 && List.length t = 0;; 
(* If the list has at least one element,it checks if the head (h) is greater than or equal to 1 AND if the length of the tail (t) is 0. If both conditions are true, it returns true, otherwise, it returns false. *)

match 1 :: [] with
| [] -> false
| h :: t -> h = 1 && t = [];;(*If at least one element h followed by a tail t, it checks h=1 and if t is an empty list []. If both conditions are true, it returns true; otherwise, it returns false.*)

  (** let head lst = match lst with h :: _ -> h;; *)
(*Warning 8 [partial-match]*)


