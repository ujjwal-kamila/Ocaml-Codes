type suit = Clubs | Diamonds | Hearts | Spades;;
type rank = Jack | Queen | King | Ace | Num of int;;
type card = suit * rank;;
type color = Red | Black;;
type move = Discard of card | Draw;;
exception IllegalMove
exception CardNot_Found
 

let x = [(Spades,Ace);(Clubs,King);(Clubs,(Num 4))];;
let y = (Clubs,King);;

(*Question (a).................. *)
let card_color card = match card with
	| Spades , _ -> Black
	| Clubs , _ -> Black
	| Diamonds , _ -> Red
	| Hearts , _ -> Red;;
	(*    card_color (Clubs,King)    *)


(*Question (b)................. *)
let card_value card = match card with
	| _ ,Num n  -> n
	| _ ,Ace -> 11
	| _->10;;
    (*	 card_value(Clubs,Ace);;   *)
    

(*Question(c).................. *)
let rec remove_card cs c e = match cs with 
	|[] -> raise e
	|h::t -> if h = c then t else h::(remove_card t c e);;
	 (*	remove_card [(Spades,King);(Clubs,Ace);(Clubs,(Num 4))];;   *)
	
	
(*Question(d).................. *)
let rec all_same_color cs = match cs with 
	|[] -> true
	|[card]->true
	|h1::h2::t-> (card_color h1 = card_color h2) && (all_same_color(h2::t));;
		
(*Question(e).................. *)
let sum_cards cs = let rec helper cs acc = match cs with
	|[] -> acc
	|h::t -> helper t(acc + card_value h) in helper cs 0;;
	
(*Question(f).................. *)
let score lst goal  = let pre_sc = let sc = sum_cards lst in if sc > goal then 3 * (sc - goal) else (goal - sc) in if (all_same_color lst) then pre_sc / 2 else pre_sc ;;






