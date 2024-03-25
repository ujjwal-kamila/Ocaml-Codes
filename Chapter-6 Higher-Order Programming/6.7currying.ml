(* 6.7. Currying*)
(* sample functions *)
 let add x y = x+y;;
(* Test case *)
 add 5 10;;

(* Another way to define a function that takes two arguments is to write a function that takes a tuple: *)
let add' t = fst t + snd t;;
(* Test case *)
add' (5,19);;

(* another implementation *)
let add'' (x, y) = x + y;;
(* Test case *)
add'' (9,18);;

(* You could even write a couple of higher-order functions to do the conversion for you: *)
let curry f x y = f (x, y);;
(* Test case *)
curry add'' 10 5;;

let uncurry f (x, y) = f x y;;
(* Test case *)
uncurry add (3, 4);;


let uncurried_add = uncurry add;;
let curried_add = curry add'';;