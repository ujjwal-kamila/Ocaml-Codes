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
let get_name m = match m with { name = n; hp = _; ptype = _ } -> n;;
let get_ptype m = match m with { name = _; hp = _; ptype = t } -> t;;

(* best way to matching in short *)
let get_hp m = match m with { name; hp; ptype } -> hp;;
let get_name m = match m with { name; hp; ptype } -> name;;
let get_ptype m = match m with { name; hp; ptype } -> ptype;;
(* better *)
let get_hp m = match m with { hp } -> hp;;
let get_name m = match m with { name } -> name;;
let get_ptype m = match m with { ptype } -> ptype;;

(* easiest best way to match*)
let get_hp m = m.hp
let get_name m = m.name
let get_ptype m = m.ptype

(* Here’s how to get the first and second components of a pair: *)
(* Both fst and snd are actually already defined for you in the standard library. *)
let fst (x, _) = x;;
let snd (_, y) = y;;

(* Finally, here are several ways to get the 3rd component of a triple: *)
(* OK *)
let thrd t = match t with x, y, z -> z;;
(* good *)
let thrd t =
let x, y, z = t in
z;;
(* better *)
let thrd t =
let _, _, z = t in
z;;
(* best  *)
let thrd (_, _, z) = z;;
