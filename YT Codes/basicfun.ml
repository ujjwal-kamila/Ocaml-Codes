let increment x = x+1;;

let increment' (x:float) : float = x +. 1.;;
(* or defione below fun*)
let increment'' x = x +. 1.;;
(*multiple arguments *)
let add x y = x + y ;;
let add (x:int) (y:int) : int = x+y;;

(*Recursive functions *)
(*fibonacci numbers 1 1 2 3 5 8 *)
let rec fib x = 
  if x = 0 then 0  else
    if x < 3 then 1 else fib (x-1) + fib(x-2);;