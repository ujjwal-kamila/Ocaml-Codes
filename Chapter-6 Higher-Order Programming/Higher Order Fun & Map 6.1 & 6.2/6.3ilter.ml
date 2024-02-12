(* 6.3. Filter *)
(* To filter out only the even numbers from a list, or the odd numbers : below fun to do that  *)
(** [even n] is whether [n] is even. *)
let even n =
  n mod 2 = 0
(** [evens lst] is the sublist of [lst] containing only even numbers. *)
let rec evens = function
  | [] -> []
  | h :: t -> if even h then h :: evens t else evens t
let lst1 = evens [1; 2; 3; 4]