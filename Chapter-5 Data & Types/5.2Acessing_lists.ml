(*Pattern maching*)

(*Sample example*)
match not true with 
| true -> "nope"
|false -> "Yes";;

(*let's see another exapmle *)
(*this is also look like switch statement*)
let x = 
  match true with 
  |true -> "Yeah"
  |false -> "nope";;

(*Another example*)
let y =
  match 42 with 
  |fooo -> fooo;;

(*example o/p either 1 or 0*)
(*not match bar so default value is 1*)
let z = 
  match "ocaml" with 
  |"bar" ->0
  | _ -> 1;;
  
(*if [] then empty *)
  let a = 
  match[] with 
  |[] -> "empty"
  |_ -> "Not empty";; 

(*h means head of th element *)
(*t means rest of the list *)
let b =
  match ["taylor" ; "swift"] with
  |[] -> "folklore"
  | h::t -> h;;  (*if -> t then type error excepted of type string[required sting list]*)

(*resolve with type string list*)
let b = 
  match ["taylor";"swift"] with
  |[] -> ["folklore"]
  |h::t -> t;;

  (*taking tuples*)
let fst3 t = 
  match t with 
  |(a, b, c) -> a;;
 
  (** first (1,2,5);;*) (*type error *)
  fst;;
  fst (1,2);;
  fst3 (10,2,5);;



