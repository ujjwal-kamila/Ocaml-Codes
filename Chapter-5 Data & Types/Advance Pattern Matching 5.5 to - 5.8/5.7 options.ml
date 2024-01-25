(*5.7 Options & 5.8. Association Lists *)
(* 5.7 Options : Suppose you want to write a function that usually returns a value of type t *)
(* define a function list_max that returns the maximum value in a list, but there’s not a sensible thing to return on an empty list: *)

(** 
let rec list_max = function
 | [] -> ???
 | h :: t -> max h (list_max t);;   gives syntax error *)

let rec list_max = function
 | [] -> 0
 | h :: t -> max h (list_max t);;

 (*Create an option that is like a box with 42 inside it:*)
Some 42;;
(* And here’s how we create an option that is like an empty box: *)
None;;

(*We can acess the contends of an options value 'e' using pattern matching : like below*)
(*In Below here is a fun that extracts an int from an option if there is one inside, and converts it to an string *)
let extract o =   (*takes option type as argument*)
  match o with   
  |Some i -> string_of_int i  (*returns str of int*)
  |None -> "";;           (*returns empty str when None*)
  extract (Some 42);;
  extract None;;

(* Define a recursive function list_max that takes a list of integers and returns an option type *)
let rec list_max = function
| [] -> None  (* Base case: if the list is empty, return None *)
| h :: t ->   (* Recursive case: if the list is not empty, split it into head (h) and tail (t) *)
  begin
    match list_max t with   (* Recursively call list_max on the tail of the list *)
    | None -> Some h        (* If the result is None, the maximum is the current head (h) *)
    | Some m -> Some (max h m) (* If the result is Some m, the maximum is the max of current head (h) and m *)
  end;;
(*test cases*)
list_max [];;   (*'a option = None*)
list_max [1;2;3;4];;(*- : int option = Some 4
*)
list_max [1];;(*- : int option = Some 1
*)

(* 5.8. Association Lists *)
(* A map is a data structure that maps keys to values : One easy implementation of a map is an association list, which is a list of pairs *)
let d = [("rectangle", 4); ("nonagon",9); ("icosagon",20)];;  (*association list that maps some shape names*)

(* Here are two functions that implement insertion and lookup in an association list: *)
(* Function to insert a key-value pair into a list *)
let insert k v lst = (k, v) :: lst
(* Recursive function to look up a key in a list of key-value pairs *)
let rec lookup k = function
  | [] -> None     (* If the list is empty, the key is not found, return None *)
  | (k', v) :: t ->  (* Otherwise, destructure the head of the list into (k', v) *)
    if k = k' then (* If the current key matches the target key *)
      Some v      (* Return Some with the corresponding value *)
    else
      lookup k t;; (* Otherwise, recursively search in the remaining tail of the list *)
(*same upper fun in easy way *)
let rec lookup k = function
| [] -> None
| (k', v) :: t -> if k = k' then Some v else lookup k t;;

lookup [];;
lookup [()];;
lookup [9;7;5;4];;
lookup [("d", 4); ("a", 1); ("b", 2); ("c", 3)];;
lookup [(3, 4); (7, 1); (0, 2); (2, 3)];;