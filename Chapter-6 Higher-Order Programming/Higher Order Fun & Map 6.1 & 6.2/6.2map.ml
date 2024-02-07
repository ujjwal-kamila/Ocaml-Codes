(* 6.2 Map *)
(** [add1 lst] adds 1 to each element of [lst] *)
let rec add1 = function
  | [] -> []
  | h :: t -> (h + 1) :: add1 t;;
let lst1 = add1 [1; 2; 3];;

