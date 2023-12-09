let add x y = x + y;;

let addx x = fun y -> x + y;;

let add5 = addx 5;;
add5 6;;

let add5 = add 5;;
add5 2;;

let add x y = x + y;;
let add x = fun y -> x + y;;
let add = fun x -> (fun y -> x + y);;

( + );;
( + ) 3 4;;

let add3 = ( + ) 3 ;;

add3 5;;

let ( ^^ ) x y = max x y;;
( ^^ ) 3 5;;