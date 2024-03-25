(* 6.4. Fold *)

(** sum of all the elements of lst *)
let rec sum = function
  | [] -> 0
  | h :: t -> h + sum t;;

let s = sum [1; 2; 3];;
let s1 = sum [5;6;8];;


(** [concat lst] is the concatenation of all the elements of [lst]. *)
let rec concat = function
  | [] -> ""
  | h :: t -> h ^ concat t;;

let c = concat ["a"; "b"; "c"];;
let d = concat ["d"; "e"; "f"];;
(* Lets try this using factor  *)

let rec sum' init = function
  | [] -> init
  | h :: t -> h + sum' init t;;

let sum = sum' 0;;
let s = sum' 1;;

let rec concat' init = function
  | [] -> init
  | h :: t -> h ^ concat' init t;;
let concat = concat' "";;

(*we can call combine as concat operator as can also become an argument to a unified function*)
let rec combine op init = function 
 |[] -> init
 |h :: t -> op h (combine op init t);;

let sum = combine(+) 0;;
let concat = combine( ^ ) "";;

(* 6.4.2. Fold Right *)
(* Function 'combine' recursively combines elements of a list using function 'f' and accumulator 'acc' *)
let rec combine f acc = function
  | [] -> acc    (*return accumulator when the list is empty *)
  | h :: t -> f h (combine f acc t) (*apply 'f' to head and result of combining tail *)


(* Function to combine elements of a list recursively with an accumulator *)
let rec combine' f lst acc = 
  match lst with
  | [] -> acc 
  | h :: t -> f h (combine' f t acc)(*apply function to head and recursively combine the tail *)

(* Function to sum elements of a list *)
let sum lst = combine' ( + ) lst 0
let concat lst = combine' ( ^ ) lst ""

(*Using the standard library function List.fold_right *)
(*Function to recursively fold a list from right to left *)
let rec fold_right f lst acc =
  match lst with
  | [] -> acc 
  | h :: t -> f h (fold_right f t acc) (* Recursively apply function f to head and accumulator, then proceed with the tail of the list *)


(* 6.4.3. Tail Recursion and Combine *)
(*create combine with recursive*)
let rec combine_tr f acc = function
  | [] -> acc                             
  | h :: t -> combine_tr f (f acc h) t  (*apply function f to acc and head, and proceed with the tail *)


(* Function to combine elements of a list using a given function *)
let rec combine f acc = function
  | [] -> acc
  | h :: t ->
    let acc' = combine f acc t in (* Recursive call to combine *)
    f h acc' (* Apply function f to current element and acc *)

(* Tail-recursive version of the combine function *)
let rec combine_tr f acc = function
  | [] -> acc
  | h :: t ->
    let acc' = f acc h in (* Apply function f to acc and current element *)
    combine_tr f acc' t (* Tail-recursive call with updated acc *)

(*test cases*)
let sum = combine_tr ( + ) 0;;
let s = sum [1; 2; 3];;

(* With substraction  *)
let sub = combine ( - ) 0;;
let s = sub [3; 2; 1];;  (*(3 - (2 - (1))) = 2*)

let sub_tr = combine_tr ( - ) 0
let s' = sub_tr [3; 2; 1](*ans will be -6*)(*we compute (((0 - 3) - 2) - 1)*)


(* 6.4.4. Fold Left *)

(* Recursive function to fold left over a list with an accumulator and function *)
let rec fold_left f acc = function
  | [] -> acc 
  | h :: t -> fold_left f (f acc h) t (*Recursive call with updated accumulator *)
let sum = fold_left ( + ) 0;;
(* Function to concatenate strings in a list using fold_left *)
let concat = fold_left ( ^ ) "";;


(* 6.4.5 Fold Left vs. Fold Right *)
List.fold_left;;
List.fold_right;;

(* using listlable module *)
ListLabels.fold_left;;
ListLabels.fold_left ~f:(fun x y -> x - y) ~init:0 [1;2;3];;

(*changing parameters x ,y *)
ListLabels.fold_left;;
ListLabels.fold_left ~f:(fun x y -> x - y) ~init:0 [1;2;3];;


(* 4.4.6. A Digression on Labeled Arguments and Fold *)

(* Function to fold from left to right *)
let rec fold_left ~op:(f: acc:'a -> elt:'b -> 'a) ~init:acc lst =
  match lst with
  | [] -> acc
  | h :: t -> fold_left ~op:f ~init:(f ~acc:acc ~elt:h) t
(* Recursive case: apply the function 'f' to the accumulator and the head of the list,
then recursively fold the tail of the list *)

(* Function to fold from right to left *)
let rec fold_right ~op:(f: elt:'a -> acc:'b -> 'b) lst ~init:acc =
  match lst with
  | [] -> acc
  | h :: t -> f ~elt:h ~acc:(fold_right ~op:f t ~init:acc)
(*recursively fold the tail of the list,
 then apply the function 'f' to the head of the list and the folded accumulator *)



 (* 4.4.7. Using Fold to Implement Other Functions *)
 (* Folding is so powerful that we can write many other list functions in terms of fold_left or fold_right. For example *)
 let length lst =
  List.fold_left (fun acc _ -> acc + 1) 0 lst;;

let rev lst =
  List.fold_left (fun acc x -> x :: acc) [] lst;;

let map f lst =
  List.fold_right (fun x acc -> f x :: acc) lst [];;

let filter f lst =
  List.fold_right (fun x acc -> if f x then x :: acc else acc) lst [];;