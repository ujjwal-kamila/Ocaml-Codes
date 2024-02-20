(* 6.4. Fold *)

(**sum of all the elements of lst *)
let rec sum = function
  | [] -> 0
  | h :: t -> h + sum t;;

let s = sum [1; 2; 3];;
let s1 = sum [5;6;8];;


(** [concat lst] is the concatenation of all the elements of [lst]. *)
let rec concat = function
  | [] -> ""
  | h :: t -> h ^ concat t;;

let c = concat ["a"; "b"; "c"];;
let d = concat ["d"; "e"; "f"];;


