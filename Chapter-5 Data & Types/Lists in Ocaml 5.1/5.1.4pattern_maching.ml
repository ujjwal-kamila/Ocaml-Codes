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

  (*from video code "Matching" *)
let bad_empty lst = 
  match lst with 
  | [] -> true
  | _ -> false;;(*if any other lists then false*)

(*sum of the elements of the lists*)
let rec bad_sum lst =
  match lst with
  |h::t -> h + bad_sum t
  |x::[] -> x 
  |[]->0;;
bad_sum [];;
bad_sum [1];;
bad_sum [5;10;15];;

(*another implenmentation of sum using hd tl*)
let rec bad_sum1 lst = 
  List.hd lst + bad_sum1 (List.tl lst);;
  List.hd [1;2;3];;
  List.tl [1;2;3];;

(*same code runs sum easily *)
let rec better_sum1 lst =
  match lst with
  | [] -> 0  (*return 0 for an empty list *)
  | hd :: tl -> hd + better_sum1 tl;;  (* Recursively sum the elements *)
  better_sum1 [1;2;3;4;5;6];;


  (** let head lst = match lst with h :: _ -> h;; *)
(*Warning 8 [partial-match]*)


(* another examplle of sum : o/p Warning 11 [redundant-case]: this match case is unused. *)
(**let rec sum lst =
  match lst with
  | h :: t -> h + sum t;;
  | [ h ] ->0;; *)  (*unused case*)

  (* the dynamic semantics of match expressions:
     length is n*)
let length_is lst n =
  match List.length lst with
  | n -> true  (*if length matches n return true else false*)
  | _ -> false;;
length_is [1;2;3] 4;;  (*always return true implement below code*)

let length_is lst n =
  match List.length lst with
  | m -> m = n;;(* If the length m matches the number n, return true; otherwise, return false *)

  (*better way to match*)
  let length_is lst n =
    List.length lst = n;;

