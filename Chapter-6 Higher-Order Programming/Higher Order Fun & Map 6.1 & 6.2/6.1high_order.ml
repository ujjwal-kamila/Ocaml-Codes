(**A higher-order function is a function that can take other functions as arguments or return functions as results, or both A higher-order function is a function that can take other functions as arguments or return functions as results, or both*)

(* Double & square functions *)
let double x = 2 * x;;
double 4;;
let square x = x * x;;
square 4;;

(*Let’s use these functions to write other functions that quadruple and raise a number to the fourth power: *)
(* Define a function 'quad' to quad a number *)
let quad x = double (double x);; (*x = x*4 *)
quad 3;;
quad 1;;

(* Define a function 'fourth' to raise a number to the fourth power *)
let fourth x = square (square x);;
fourth 2;;
fourth 3;;

(*implement the twice fun from upper*)
let twice f x = f (f x);;
twice quad 1;;  (*quad 1= 4 .... twice 4 = 4*4 *)
twice square 2;; (*ans:16,as squares 2 twice: 2*2*2*2.*)

(* quad computes the quadruple of its input by using twice with double. *)
let quad x = twice double x;;
quad 1;;
quad 2;;
(* fourth computes the fourth power of its input by using twice with square. *)
let fourth x = twice square x;;
fourth 1;;
fourth 3;;


(* 6.1.1 The Abstraction Principle *)
(* We can write a function that applies its first input to its second input: *)
let apply f x = f x

(*using pipe line operator*)
let pipeline x f = f x;;
pipeline 3 square ;;
let (|>) = pipeline;;

let x = 5 |> double;;

(* We can write a function that composes two other functions: *)
let compose f g x = f( g x);;
compose double square 3;;

(* This function would let us create a new function that can be applied many times, such as the following: *)
let square_then_double = compose double square;;
let x = square_then_double 1;;
let y = square_then_double 2;;

(*we can write a function that appliers two function to the same argument and returns a pair of the result*)
let both f g x = (f x, g x)
let ds = both double square
let p = ds 3;;

(*sample positive fun *)
let is_positive n = n > 0

(* We can write a function that conditionally chooses which of two functions to apply based on a predicate: *)
let cond p f g x =
  if p x then f x else g x;;
(* Example usage: *)
cond is_positive double square 9;;  (*means f x  *)
cond is_positive square double 9;;  (*means g x *)