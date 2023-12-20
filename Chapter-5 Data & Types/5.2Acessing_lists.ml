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

  (*let's see an empty list examples*)
let empty lst = 
  match lst with 
  |[] -> true
  |h::t ->false;;
  (*tests for the upper function*)
  empty [1;2];;

  let rec sum lst = 
    match lst with 
    |[] -> 0 
    |h :: t -> h + sum t;;
  (*tests for the upper function*)
  sum[];;
  sum[1;2;3];;
  (**for see what is the steps going on here in th upper fun run "#trace sum "*)
  #trace sum;;
  sum[1;2;3];;

  (*another example*)
  let rec length lst = 
    match lst with 
   |[] -> 0
   | h::t -> 1 + length t;;
    (*tests for the upper function*)
  length [];;
  length [1;2;3;4;5;6;7;8];;
  (* #trace length ;; for trace and see what happpens to it *)

  (* example :  append *)
  (*Exaplme usage :
     append [1;2;3] [4;5;6] is [1;2;3;4;5;6]*)
  let rec append lst1 lst2 = 
    match lst1 with 
    | [] -> lst2
    | h::t -> h :: append t lst2;;
(*test cases for the upper function*)
  append [1;2;3] [4;5;6];;
  (*or use [1;2;3] @  [4;5;6];;*)
   [1;2;3] @  [4;5;6];;
  