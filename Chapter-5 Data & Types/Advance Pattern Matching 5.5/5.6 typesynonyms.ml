(* 3.6. Type Synonyms *)
type point = float * float
type vector = float list
type matrix = float list list;;

(* In the following code, get_x doesn’t care whether you pass it a value that is annotated as one vs. the other:*)
(* Define a function get_x that takes a pair (x, _) and returns x *)
let get_x = fun (x, _) -> x;;

let p1 : point = (1., 2.)(* Define two points p1 and p2 *)
let p2 : float * float = (4., 3.);;

let a = get_x p1
let b = get_x p2