(* Exercise: list expressions [★] *)
let list = [1;2;3;4;5];;

let list1 = 1::2::3::4::5::[];;

let list2 = [2]@[3;4];;

(*  Exercise: product [★★]*)
let rec product = function 
|[]->1
|h::t -> h * product t;;


(* Exercise: concat [★★]*)
let rec concate = function 
|[] ->""
|h::t -> h ^ concate t;;

(* Exercise: product test [★★] *)
assert(product list = 120);;

(* Exercise: patterns [★★★] *)
let patterns = function 
|[]-> false
|h::t -> h = "bigred" ;;

let rec  twofour = function 
|_::_::[] -> true
|_::_::_::_::[]-> true
|_->false;;

let rec check = function 
|[]->false
|h1::h2::_-> h1=h2
|_->false;; 

(* Exercise: library [★★★] *)
let nth_element lst =
  if(List.length lst) >= 5 then List.nth lst 4 else 0;;

nth_element [1;2;3;45;44;48;50]

let sorting lst = List.rev (List.sort Stdlib.compare lst);;


(* Exercise: library test [★★★] *)

(* Ounit is not avilable  *)

(* Exercise: library puzzle [★★★] *)




