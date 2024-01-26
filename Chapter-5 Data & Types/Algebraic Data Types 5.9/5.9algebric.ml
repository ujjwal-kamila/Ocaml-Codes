(* 5.9 Algebraic Data Types *)
(*we have seen varients as earlier concept*)
type day = Sun | Mon | Tue | Web | Thu | Fri | Sat 
type ptype = TNormal | TFire | Twater 
type peff = ENormal | ENotVery | Esuper;;

(* As a running example, here is a variant type shape that does more than just enumerate values: *)
type point = float * float
type shape = 
  |Point of point 
  |Circle of point * float  (* center and radius *)
  |Rect of point * point ;;  (* lower-left and upper-right corners *)

(*From video 1 : 5.9.1 Variants that Carry Data*)

type primary_color = Red | Green | Blue
let r = Red;;
let g = Green;;
(* Define a type for shapes *)
type point = float * float

type shape =
  |Circle of {center : point; radius : float}
  |Rectangle of {lower_left : point ; upper_right : point}

let c1 =  Circle {center = (0., 0.); radius = 1.}
let r1 = Rectangle {lower_left = (-1. , -1.); upper_right=(1. , 1.)}

  (*From video part1  : pattern matching with varients*)

(* Helper function to calculate the average of two values *)
let avg a b = (a +. b) /. 2.;;

(* Function to find the center of a shape *)
let center s = 
  match s with 
   |Circle {center;radius} -> center
   |Rectangle{lower_left;upper_right} ->        (* Destructure the points of the rectangle *)

        let( x_ll, y_ll) = lower_left in 
        let (x_ur , y_ur) = upper_right in 
        (avg x_ll  x_ur , avg y_ll  y_ur);;
(*test cases*)

center (Rectangle { lower_left = (0.0, 1.0); upper_right = (4.0, 5.0) })


