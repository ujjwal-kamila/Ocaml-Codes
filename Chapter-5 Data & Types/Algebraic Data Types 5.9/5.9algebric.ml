(* 5.9 Algebraic Data Types *)
(*we have seen varients as earlier concept*)
type day = Sun | Mon | Tue | Web | Thu | Fri | Sat 
type ptype = TNormal | TFire | Twater 
type peff = ENormal | ENotVery | Esuper;;

(*From video : 5.9.1 Variants that Carry Data*)

type primary_color = Red | Green | Blue
let r = Red;;
let g = Green;;
type point = float * float

type shape =
  |Circle of {center : point; radius : float}
  |Rectangle of {lower_left : point ; upper_right : point}

let c1 =  Circle {center = (0., 0.); radius = 1.}
let r1 = Rectangle {lower_left = (-1. , -1.); upper_right=(1. , 1.)}








(* As a running example, here is a variant type shape that does more than just enumerate values: *)
type point = float * float
type shape = 
  |Point of point 
  |Circle of point * float  (* center and radius *)
  |Rect of point * point ;;  (* lower-left and upper-right corners *)
