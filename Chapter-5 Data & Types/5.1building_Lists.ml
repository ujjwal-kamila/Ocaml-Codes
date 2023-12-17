(* 5.1 Lists *)
(* Building Lists : Syntax of empty list []*)

[];;   (*[] means 'a list*)

(** e1 :: e2;; *)
(** [e1;e2;e3.....;en] *)

(*int list*)
[1];; 
[1;2;3;4;5;6;7;8;9;10];;

(*int list list*)
[[1;2];[4;5];[6;8]];;


(*Float lists**)
[1.;2.;3.;4.];;

(*bool list*)
[true ; false];;

(**string list*)
["hi";"hello"];;

(*put another elements in list *)
1 :: [2;3];;
10 :: 14 :: [25;67];;

(*List can be nested *)
[[[]] ; [[1;3;4]]];;

(*[] pronouces nill*)
(* :: pronouces Cons*)




