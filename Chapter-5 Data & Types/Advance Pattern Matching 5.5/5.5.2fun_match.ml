(* 5.5.1. Pattern Matching with Let *)
(*syntax :  "let p = e1 in e2" *)

(* 5.5.2 Pattern Matching with Functions *)
(**let f p1 ... pn = e1 in e2*)   (* function as part of let expression *)
(**let f p1 ... pn = e*)          (* function definition at toplevel *)
(**fun p1 ... pn -> e*)           (* anonymous function *)

(***from video*)
(* Pokemon types *)
type ptype = TNormal | TFire | TWater;;

type peff = ENormal | ENotVery | ESuper;;
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

(* Pokemon types *)
type ptype = TNormal | TFire | TWater;;
(* A record to represent Pokemon *)
type mon = { name : string; hp : int; ptype : ptype };;
(*we can do various type of matching likes below  *)
(*normal way to match with full function *)
let get_hp m = match m with { name = n; hp = h; ptype = t } -> h;;
let get_name m = match m with { name = n; hp = h; ptype = t } -> n;;
let get_ptype m = match m with { name = n; hp = h; ptype = t } -> t;;

(* better way to match *)
let get_hp m = match m with { name = _; hp = h; ptype = _ } -> h;;

(* best way to matching in short *)
let get_hp m = match m with { name; hp; ptype } -> hp;;
(* better *)
let get_hp m = match m with { hp } -> hp;;

(* easiest best way to match*)
let get_hp m = m.hp
let get_hp m = m.name
let get_hp m = m.ptype