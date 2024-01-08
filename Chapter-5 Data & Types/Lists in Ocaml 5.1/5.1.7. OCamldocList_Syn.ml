(* 5.1.7. OCamldoc and List Syntax *)
(* for List.hd in the standard library source code: *)

(** Return the first element of the given list. Raise
[Failure "hd"] if the list is empty. *)

(* For example, here is a
way we could rewrite that comment: *)

(** [hd lst] returns the first element of [lst].
Raises [Failure "hd"] if [lst = []]. *)

