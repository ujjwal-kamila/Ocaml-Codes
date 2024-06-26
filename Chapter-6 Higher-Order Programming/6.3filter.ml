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

(*Another Implementation*)
(** [odd n] is whether [n] is odd. *)
let odd n =
  n mod 2 <> 0

(** [odds lst] is the sublist of [lst] containing only odd numbers. *)
let rec odds = function
  | [] -> []
  | h :: t -> if odd h then h :: odds t else odds t

  let lst2 = odds [1; 2; 3; 4 ; 5]


(* The 'filter' function takes a predicate 'p' and a list as arguments.
   It recursively filters elements of the list based on the predicate. *)
let rec filter p = function
  | [] -> []
  | h :: t ->
  if p h then h :: filter p t 
  else filter p t;;

let evens = filter even;;
filter (even) [1;2;3;4;5;6;7];;
let odds = filter odd;;
filter (odd) [1;2;3;4;5;6;7];;

(*same test cases with fun implementation*)
filter (fun x -> x mod 2 = 0) [1; 2; 3; 4; 5; 6; 7; 8];;
filter(fun x -> x mod 2 <> 0) [1; 2; 3; 4; 5; 6; 7;8];;  

(* 6.3.1. Filter and Tail Recursion *)
let rec filter_aux p acc = function
  | [] -> acc
  | h :: t -> if p h then filter_aux p (h :: acc) t else filter_aux p acc t

let filter p = filter_aux p []

let lst = filter even [1; 2; 3; 4]

(* Here, the standard library makes a different choice than it did with map. It builds in the reversal to List.filter, which is implemented like this: *)
let rec filter_aux p acc = function
  | [] -> List.rev acc (* note the built-in reversal *)
  | h :: t -> if p h then filter_aux p (h :: acc) t else filter_aux p acc t

let filter p = filter_aux p []
