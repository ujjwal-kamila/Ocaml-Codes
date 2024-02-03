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
   |Rectangle{lower_left;upper_right} -> (* Destructure the points of the rectangle *)

        let( x_ll, y_ll) = lower_left in 
        let (x_ur , y_ur) = upper_right in 
        (avg x_ll  x_ur , avg y_ll  y_ur);;
(*test cases*)

center (Rectangle { lower_left = (0.0, 1.0); upper_right = (4.0, 5.0) })

(*from video : part 2 implementation of upper pattern matching*)

type point = float * float

type shape =
  |Circle of {center : point; radius : float}
  |Rectangle of {lower_left : point ; upper_right : point}
  |Point of point (*add for part 2 implement pattern matching*)
let p1 = Point (31. , 10.)

let center s = 
  match s with 
   |Circle {center;radius} -> center
   |Rectangle{lower_left = (x_ll,y_ll);
              upper_right=(x_ur,y_ur)} ->
        (avg x_ll  x_ur , avg y_ll  y_ur)
    |Point p-> p;;

(* Here are a couple functions that use the shape type: *)


(* Define a type 'shape' with three possible constructors: Point, Circle, and Rect *)
type point = float * float
type shape =
  | Point of point
  | Circle of point * float
  | Rect of point * point


(* Function to calculate the area of a given shape *)
let area = function
  | Point _ -> 0.0 (* Area of a point is considered as 0 *)
  | Circle (_, r) -> Float.pi *. (r ** 2.0) (* Area of a circle: π * r^2 *)
  | Rect ((x1, y1), (x2, y2)) ->
      let w = x2 -. x1 in (* Calculate the width of the rectangle *)
      let h = y2 -. y1 in (* Calculate the height of the rectangle *)
      w *. h           (* Area of a rectangle: width * height *)

(* Function to find the center of mass of a given shape *)
let center = function
  | Point p -> p      (* Center of mass of a point is the point itself *)
  | Circle (p, _) -> p (* Center of mass of a circle is its center *)
  | Rect ((x1, y1), (x2, y2)) ->(* Center of mass of a rectangle is the midpoint of its diagonal *)
      ((x2 +. x1) /. 2.0, (y2 +. y1) /. 2.0)

(* Here, for example, is a type that represents either a string or an int: *)
type string_or_int =
  | String of string
  | Int of int;;

  type string_or_int_list = string_or_int list

  let rec sum : string_or_int list -> int = function
    | [] -> 0
    | String s :: t -> int_of_string s + sum t
    | Int i :: t -> i + sum t
  
  let lst_sum = sum [String "1"; Int 2];;

(*for multiple constructers carry same type*)
(*there is a new type 't' with two constructers*)
type t = Left of int | Right of int (*noth taking an int*)
(* Create a value 'x' of type 't' with the constructor 'Left' and the argument '1'. *)
let x = Left 1
(*define a fun 'double_right'that pattern matches on a value of type 't'*)
let double_right = function
| Left i -> i (*if cons with Left return the integer value. *)
| Right i -> 2 * i;; (*if right then twice the integer*)
  (* 5.9.2 Syntax and Semantics : Syntax :"type t = C1 [of t1] | ... | Cn [of tn]" *)
(* To write an expression that is a variant:
C e Or : C *)

(* 5.9.3 Catch-all Cases *)

(*Write function and color varients*)
type color = Blue | Red | Green
let string_of_color = function
| Blue -> "blue"
| _ -> "red";;

string_of_color Blue;;
string_of_color Green;;(*The problem is the catch-all case in the pattern match inside string_of_color: the final case that uses the wildcard pattern to match anything.*)
(**better way *)
(* let string_of_color = function
| Blue -> "blue"
| Red -> "red";; *)

(*5.9.4 Recursive Varients*)
(* Define a type 'intlist' that represents a list of integers *)
type intlist = Nil | Cons of int * intlist
(* Create a list 'lst3' containing a single element 3 *)
let lst3 = Cons (3, Nil) (* similar to 3 :: [] or [3] *)

(* Create a list 'lst123' containing elements 1, 2, and 3 *)
let lst123 = Cons(1, Cons(2, lst3)) (* similar to [1; 2; 3] *)

(* Define a recursive function 'sum' that calculates the sum of elements in the list *)
let rec sum1 (l : intlist) : int =
  match l with
  | Nil -> 0
  | Cons (h, t) -> h + sum1 t;;
sum1 lst123;;
sum1(Cons(1, Cons(2, Cons(3, Cons(4,Nil)))));;

(* Define a recursive function 'length' that calculates the length of the list *)
let rec length : intlist -> int = function
  | Nil -> 0
  | Cons (_, t) -> 1 + length t

(* Define a function 'empty' that checks if the list is empty *)
let empty : intlist -> bool = function
  | Nil -> true
  | Cons _ -> false;;
