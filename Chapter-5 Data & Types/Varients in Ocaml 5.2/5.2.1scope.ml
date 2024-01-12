(* 5.2.1 Scope *)
 (*takes two varients t1 & t2 and store with constructor C | D | E*)
type t1 = C | D
type t2 = D | E
let x = D;;  (*assign D to the variable x*)
(*ans is x : t2 *)



type ptype =
TNormal | TFire | TWater
type peff =
ENormal | ENotVery | ESuper;;
