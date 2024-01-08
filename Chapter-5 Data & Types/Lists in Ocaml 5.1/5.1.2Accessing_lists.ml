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

  (* example :  append using cons "::"*)
  (*Exaplme usage :
     append [1;2;3] [4;5;6] is [1;2;3;4;5;6]*)
  let rec append lst1 lst2 = 
    match lst1 with 
    | [] -> lst2
    | h::t -> h :: append t lst2;;
    (*same function with another example*)
  (* Define a function to append two lists using cons (::) operator *)
let rec append_lists list1 list2 =
  match list1 with
  | [] -> list2  
  | head :: tail -> head :: (append_lists tail list2) 
(* Example usage  *)
let list_a = [1; 2; 3]
let list_b = [4; 5; 6]
let result = append_lists list_a list_b
;;

(*test cases for the upper function*)
  append [1;2;3] [4;5;6];;
  (* shortcut to append two lists lst1 and lst2  use "lst1 @ lst2 ;;" *)
  (*or use [1;2;3] @  [4;5;6];;*)
   [1;2;3] @  [4;5;6];;
   [[1;2;3] ::  [4;5;6]];;
   [] @ [1;3;5];;


   (*we could write a function to determine whether a list is empty:*)
   let empty lst =
    match lst with
    | [] -> true
    | h :: t -> false;;

    (* better way to write the same function without pattern matching: *)
    let empty lst =
      lst = [];;

