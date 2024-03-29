(* 5.2. Variants *)
(* '''Syntax: Defining a variant type:
 type t = C1 | ... | Cn *)
type day = Sun | Mon | Tue | Wed | Thu | Fri | Sat
let d = Sun;;

let int_of_day d =
  match d with
  | Sun -> 1
  | Mon -> 2
  | Tue -> 3
  | Wed -> 4
  | Thu -> 5
  | Fri -> 6
  | Sat -> 7;;

type t1 = C | D
type t2 = D | E
let x = D;;