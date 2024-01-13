(* 5.4 Records and Tuples *)

(* Define a variant type 'ptype' with three possible constructors: TNormal, TFire, and TWater *)
type ptype = TNormal | TFire | TWater;;

(* Define a record type 'mon' with three fields: name (string), hp (integer), and ptype (ptype) *)
type mon = {name : string; hp : int; ptype : ptype};;

(* Create a record of type 'mon' with values for each field *)
{name = "Charmander"; hp = 39; ptype = TFire};; (*here hp = hit points *)

(*To access a record and get a field from it, we use the dot "." notation*)
let c = {name = "Charmander"; hp = 39; ptype = TFire};;
c.hp;;  (*acess via dot'.' notation*)
c.name;;
c.ptype;;

(*using pattern matching by asssign pattern variables n,h,t*)
match c with {name = n; hp = h; ptype = t} -> h;;
match c with {name = n; hp = h; ptype = t} -> t;;
match c with {name = n; hp = h; ptype = t} -> n;;

(*Record expression is written as *)
(**{f1 = e1; ...; fn = en}*)
(* A field access is written: "e.f" *)

(* A record type is written:
{f1 : t1; ...; fn : tn} *)

(**Another syntax is also provided to construct a new record out of an old record:
'{e with f1 = e1; ...; fn = en}'*)