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
|h::t -> if h = "bigred" then true else false ;;

let rec  twofour = function 
|_::_::[] -> true
|_::_::_::_::[]-> true
|_->false;;

