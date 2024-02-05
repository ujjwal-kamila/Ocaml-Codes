(**A higher-order function is a function that can take other functions as arguments or return functions as results, or bothzA higher-order function is a function that can take other functions as arguments or return functions as results, or both*)

(* Double & square functions *)
let double x = 2 * x;;
double 4;;
let square x = x * x;;
square 4;;

(*Let’s use these functions to write other functions that quadruple and raise a number to the fourth power: *)
(* Define a function 'quad' to quadruple a number *)
let quad x = double (double x);; (*x = x*4 *)
quad 3;;
quad 1;;

(* Define a function 'fourth' to raise a number to the fourth power *)
let fourth x = square (square x);;
fourth 2;;

(*implement the twice fun from upper*)
let twice f x = f (f x);;