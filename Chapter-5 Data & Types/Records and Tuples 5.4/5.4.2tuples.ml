(* 5.4.2 Tuples *)

(* Syntax : A tuple is written *)
(**(e1, e2, ..., en) *)

(* some examples of tuples: *)
(1, 2, 10);;
(true, "Hello");;
([1; 2; 3], (0.5, 'X'));;

(*sum of three values*)
match (1, 2, 3) with (x, y, z) -> x + y + z;;