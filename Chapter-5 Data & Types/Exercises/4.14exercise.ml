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

let last_element lst = List.hd (List.rev lst);;
last_element list;;

let any_zeros lst = 
  List.exists (fun x -> x=0 )lst;;


(* Exercise: take drop [★★★] *)

let rec take n lst =
  if n = 0 then
    []
  else
    match lst with 
    | [] -> []
    | h :: t -> h :: take (n - 1) t;;

take 4 list;;

let rec drop n lst = if n=0 then lst else match lst with 
|[] -> []
|h::t -> drop(n-1)t ;;

drop 2 list;;

(* Exercise: take drop tail [★★★★] *)
let rec take_rec n lst acc =
  if n = 0 then acc else match lst with
  |[]-> []
  | h::t -> take_rec (n-1) t (h::acc);;

  take_rec 4 list ;;

let take_reverse n lst = 
  List.rev(take_rec n lst []);;

  take_reverse 3 list;;

  (* Exercise: unimodal [★★★] *)
  (* Done will be Tonight *)


(* Exercise: powerset [★★★] *)
let rec powerset = function
| [] -> [[]]
|h::t -> let p = powerset t in List.map (List.cons h) p @ p;;
powerset [1;2;3;4];;


(* Exercise: print int list rec [★★] *)
let rec print_int_list = function
| [] -> ()
| h :: t -> print_endline(string_of_int h); print_int_list t;;

print_int_list [100;200;500;1000]

(* Exercise: print int list rec [★★] *)