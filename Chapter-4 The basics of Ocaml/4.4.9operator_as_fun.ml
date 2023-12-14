
(**4.4.9 Operators as Functions*)
(**by addding*)
( + );;
( + ) 3 4;;

let add3 = ( + ) 3 ;;

add3 5;;

(*function*)
let ( ^^ ) x y = max x y;;  (**evaluates to y(next option)*)
( ^^ ) 3 10;;  
( ^^ ) 3.14 5.16;;  

(************4.4.10 Tail Recursion*************)
(* Recursive Count function *)
let rec count n =
  if n = 0 then 0 
  else 1 + count (n - 1);;
count 10;;   (**test cases*)
(* count 100000000;; *)  (**Stack overflow during evaluation (looping recursion?).*)

(* count_forever fun *)
let rec count_forever n = 1 + count_forever n;;

let rec count_aux n acc =
  if n = 0  then acc else count_aux (n-1) (acc+1);;
let count_tr n = count_aux n 0;;

let rec count n =
  if n = 0 then 0 else 1 + count (n - 1)
  let rec count_aux n acc =
  if n = 0 then acc else count_aux (n - 1) (acc + 1);;

  (**Factorial function*)
  let rec fact n =if n = 0 then 1 else n * fact (n - 1);;
  fact 5;;
  fact 10;;

  (* write a new “main” function that calls the helper with the original base case as the accumulator: *)
  let rec fact_aux n acc =if n = 0 then 1 else n * fact_aux(n - 1) (n * acc);;
  let rec fact_tr n = fact_aux n 1;;
  fact 50;;
  fact 10;;