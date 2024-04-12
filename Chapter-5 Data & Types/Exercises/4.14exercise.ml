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
let print_int_list' lst = 
  List.iter (fun x -> print_endline (string_of_int x )) lst
(* print_int_list' [100;200;500;1000];; *)


  (* Exercise: student [★★] *)

type student = {first_name : string ; last_name : string ; gpa : float}

let s = {first_name = "Ujjwal" ; last_name = "Kamila" ; gpa= 8.1}

let s_full_name s = 
  s.first_name ,s.last_name ;;

  let sa_stud f l g =
    { first_name = f; last_name = l; gpa=g };;

    s_full_name s ;;


(* Exercise: pokerecord [★★] *)

type poketype  = Normal | Fire |Water

type pokemon = {name : string ; hp:int ; ptype : poketype}

let charizard ={name = "charizard"; hp = 78; ptype =Fire};;
let squirtle ={name = "squirtle"; hp = 44; ptype =Water};;

(* Exercise: safe hd and tl [★★] *)

let safe_hd = function
|[] ->None
|h::t -> Some h;;

let safe_tl = function
|[] ->None
|h::t -> Some h;;

(* Exercise: pokefun [★★★] *)
let rec max_hp = function
|[] -> None 
|h::t -> begin 
  match max_hp t with 
  |None -> Some h
  |Some h1 -> Some (if h.hp>= h1.hp then h else h1)
end;;

(* Exercise: date before [★★] *)
type date = int * int * int 

let is_before day1 day2 = 
  let (y1,m1,d1) = day1 in 
  let (y2,m2,d2) = day2 in 
  y1 >y2 || (y1=y2 && m1>m2) || (y1=y2 && m1=m2 && d1>d2);;

  is_before (2024,12,04) (2024,12,02);;
  is_before (2024,12,04) (2024,12,08);;

(* Exercise: earliest date [★★★] *)
let rec earliest = function
| [] -> None 
|h::t -> begin
  match earliest t with 
  |None -> Some h
  |Some h1 -> Some (if is_before h h1 then h else h1)
end;;

(* Exercise: assoc list [★] *)

(*done in tonight *)

(* Exercise: cards [★★] *)
type suit = Hearts | Spades | Clubs | Diamonds

type rank = Number of int | Ace | Jack | Queen | King

type card = { suit: suit; rank: rank }

let ace_of_clubs : card = { suit = Clubs; rank = Ace }
let queen_of_hearts : card = { suit = Hearts; rank = Queen }
let two_of_diamonds : card = { suit = Diamonds; rank = Number 2 }
let seven_of_spades : card = { suit = Spades; rank = Number 7 };;


(* Exercise: matching [★] *)
