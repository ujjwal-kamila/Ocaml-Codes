(* 4.4.1 Function Definitions *)
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

(*4.4.2 Anonymous Functions : it will be entered at
the toplevel without giving it a name:*)
42;;
let x = 42;;
(**we have two ways to write an inc function *)
let inc x = x+1;;
let inc x = fun x ->x+1;;




