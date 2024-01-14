(* 5.5.1. Pattern Matching with Let *)
(*syntax :  "let p = e1 in e2" *)

(* 5.5.2 Pattern Matching with Functions *)
(**let f p1 ... pn = e1 in e2*)   (* function as part of let expression *)
(**let f p1 ... pn = e*)          (* function definition at toplevel *)
(**fun p1 ... pn -> e*)           (* anonymous function *)

(***from video*)
(* Pokemon types *)
type ptype = TNormal | TFire | TWater

type peff = ENormal | ENotVery | ESuper
(**attacking matching with ptype and peff*)
let mult_of_eff = function
  | ENormal -> 1.
  | ENotVery -> 0.5
  | ESuper -> 2.0

let eff = function
  | (TFire,TFire) | (TWater,TWater) | (TFire,TWater) -> ENotVery
  | (TWater , TFire) -> ESuper
  | _ -> ENormal;;


(* 5.5.3 Pattern Matching Examples *)