
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