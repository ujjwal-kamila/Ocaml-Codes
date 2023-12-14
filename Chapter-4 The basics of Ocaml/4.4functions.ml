(**Recursive function*)
let rec fact n = if n = 0 then 1 else n * fact (n - 1);;
fact 10;;

(** [pow x y] is [x] to the power of [y].
Requires: [y >= 0]. *)
let rec pow x y = if y = 0 then 1 else x * pow x (y - 1);;
pow 2 5;;

(*customize type**)
let rec pow (x:int) (y:int) : int  = if y = 0 then 1 else x * pow x (y - 1);;
(**Odd even function*)
let rec even n =
  n = 0 || odd (n - 1)
  (** [odd n] is whether [n] is odd.
  Requires: [n >= 0]. *)
  and odd n =
n <> 0 && even (n - 1);;

(*Anonymous Functions : it will be entered at
the toplevel without giving it a name:*)
42;;
let x = 42;;
(**we have two ways to write an inc function *)
let inc x = x+1;;
let inc x = fun x ->x+1;;




(**Pipeline operator " |> "*)
(**Square function using pipeline |> *)
let square x = x * x;;
(**Increment function using pipeline |> *)
let inc = fun x -> x + 1;;
square (inc 5);;
5 |> inc |> square;;
5 |> inc |> square |> inc |> inc |> square;;
square (inc (inc (square (inc 5))));;

(**Polymorphic Function "It is a Function that simply returns its input type"*)
let id x = x;;

id 42;;
id true;;
id "bigred";;
(**  It simply returns its input type*)
let id' : 'a -> 'a = fun x -> x + 1;;
let id_int' : int -> int = id;;

let id' : 'a -> 'a = fun x -> x + 1;;

(**Restrictive type to a polymorphic function : Examples*)
let id_int (x : int) : int = x;;
let id_int' : int -> int =id;;

id_int true;; (**Type error*)
id' true;;  (**Type error*)

let first x y = x;;
let first_int : int -> 'b -> int = first;;
(* let bad_first : int -> 'b -> string = first;;    this is not a valid string *) 

(**4.4.6 "String.sub" it  returns a substring of the given string*)
String.sub;;
(*takes two int name1 & name2 returns int -> <fun>*)
let f ~name1:arg1 ~name2:arg2 = arg1 + arg2;;
f ~name2:3 ~name1:4;;

(*takes two int name1 & name2 returns int -> <fun>*)
let f ~name1:name1 ~name2:name2 = name1 + name2;;
f ~name1:100 ~name2:10;;
let f ~name1 ~name2 = name1 + name2;;

(* Syntax to write both a labeled argument and an explicit type annotation for it is *)
(*for int*)
let f ~name1:(arg1 : int) ~name2:(arg2 : int) = arg1 + arg2;;
f ~name:2 7;;
(* Optional arguments *)
let f ?name:(arg1=8) arg2 = arg1 + arg2;;
f 10;;

(** 4.4.7  Partial Application *)
(**addition function*)
let add x y = x + y;;

(**similar function*)
let addx x = fun y -> x + y;;

let add5 = addx 5;;
add5 6;;

let add5 = add 5;;
add5 2;;

(**different ways of expressing the same computation*)
let add x y = x + y;;
let add x = fun y -> x + y;;
let add = fun x -> (fun y -> x + y);;

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

(**4.4.10 Tail Recursion*)
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