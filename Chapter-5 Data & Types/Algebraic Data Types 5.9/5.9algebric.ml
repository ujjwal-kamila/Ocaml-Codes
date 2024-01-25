(* 5.9 Algebraic Data Types *)
(*we have seen varients as earlier concept*)
type day = Sun | Mon | Tue | Web | Thu | Fri | Sat 
type ptype = TNormal | TFire | Twater 
type peff = ENormal | ENotVery | Esuper;;

(*5.9.1 Variants that Carry Data*)
(* As a running example, here is a variant type shape that does more than just enumerate values: *)
type point = float * float
type shape = 
  |Point of point 
  |Circle of point * float  (* center and radius *)
  |Rect of point * point ;;  (* lower-left and upper-right corners *)
