(* 6.2 Map *)
(** [add1 lst] adds 1 to each element of [lst] *)
let rec add1 = function
  | [] -> []
  | h :: t -> (h + 1) :: add1 t;;
let lst1 = add1 [1; 2; 3];;

(** [concat_bang lst] concatenates "!" to each element of [lst] *)
let rec concat_bang = function
  | [] -> []
  | h :: t -> (h ^ "!") :: concat_bang t (*destructure it into head (h) and tail (t) & Concatenate "!" to the current head (h) *)

let lst2 = concat_bang ["sweet"; "salty"];;

(*Add versus concatenate Let's rewrite two fun to make the difference*)
(** [add1 lst] adds 1 to each element of [lst] *)
let rec add1 = function
  | [] -> []
  | h :: t ->
    let f = fun x -> x + 1 in
    f h :: add1 t;;
add1 [4;5;6];;
(** [concat_bang lst] concatenates "!" to each element of [lst] *)
let rec concat_bang = function
  | [] -> []
  | h :: t ->
    let f = fun x -> x ^ "!" in
    f h :: concat_bang t;; (* Apply [f] to the head [h] and recursively process the tail [t] *)
concat_bang ["hello"; "world"];;


(*make the functions without repeat the whole code *)
let rec add1' f = function
  | [] -> []
  | h :: t -> f h :: add1' f t

(** [add1 lst] adds 1 to each element of [lst] *)
let add1 = add1' (fun x -> x + 1)

let rec concat_bang' f = function
  | [] -> []
  | h :: t -> f h :: concat_bang' f t

(** [concat_bang lst] concatenates "!" to each element of [lst] *)
let concat_bang = concat_bang' (fun x -> x ^ "!");;
concat_bang ["Hello"; "World"];;


(*implement using Transform function*)
let rec transform f = function
  | [] -> []
  | h :: t -> f h :: transform f t;;
transform (fun x -> x * 2) [1; 2; 3; 4]

(** [add1 lst] adds 1 to each element of [lst] *)
let add1 = transform (fun x -> x + 1);;
add1[];;
(** [concat_bang lst] concatenates "!" to each element of [lst] *)
let concat_bang = transform (fun x -> x ^ "!");;
concat_bang ["Hello"; "World"];;


(*using map*)
let rec map f = function
  | [] -> []
  | h :: t -> f h :: map f t;;

(** [add1 lst] adds 1 to each element of [lst] *)
let add1 = map (fun x -> x + 1);;
add1 [1; 2; 3]
(** [concat_bang lst] concatenates "!" to each element of [lst] *)
let concat_bang = map (fun x -> x ^ "!");;

(*implementing map : from video codes*)
let rec add1 = function
  | [] -> []
  | h :: t -> (h+1) :: add1 t;;

let rec concat3110 = function 
  | [] -> []
  | h :: t -> (h ^ "3110") :: concat3110 t;;
  
let rec transform f = function 
  | [] -> []
  | h :: t ->  f h :: transform f t;;
  
(* 6.2.1. Side Effects *)
let p x = print_int x; print_newline(); x + 1;;
p 3110;;
let lst = map p [1; 2]

(* use a let expression to cause the evaluation of the function application to occur before the recursive call: *)
let rec  map f = function 
  | [] -> []
  | h :: t -> let h' = f h in h' :: map f t ;;

let lst = map p [1;2];;

(* 6.2.2. Map and Tail Recursion : the implementation of map is not tail recursive. *)

(*helper fun for tail-recursive map *)
let rec map_tr_aux f acc = function
  | [] -> acc
  | h :: t -> map_tr_aux f (acc @ [f h]) t;;
(*apply the function f to the head of the list, append the result to the accumulator, and recurseon the tail of the list *)

let map_tr f = map_tr_aux f [] (*Initialize the accumulator with an empty list *)
(*test case with empty [] acc *)
let lst = map_tr_aux (fun x -> x + 1) [] [1; 2; 3];;
let lst = map_tr (fun x -> x + 1) [1; 2; 3] (*without acc delclearing*)

(*without using append @ : we could use the constant-time cons operation instead of the linear-time append operation: *)
let rec map_tr_aux f acc = function
  | [] -> acc
  | h :: t -> map_tr_aux f (f h :: acc ) t;;
let map_tr f = map_tr_aux f[]
let lst1 = map_tr (fun x -> x + 1) [1;2;3]



(* he standard library calls this function List.rev_map, that is, a (tail-recursive) map function that returns its output in reverse order. *)
let rec rev_map_aux f acc = function
  | [] -> acc
  | h :: t -> rev_map_aux f (f h :: acc) t

let rev_map f = rev_map_aux f []

let lst = rev_map (fun x -> x + 1) [1; 2; 3]

(* 6.2.3. Map in Other Languages : not nessesary *)

(**>>> print(list(map(lambda x: x + 1, [1, 2, 3])))
[2, 3, 4]*)