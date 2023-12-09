let square x = x * x;;
let inc = fun x -> x + 1;;
square (inc 5);;
5 |> inc |> square;;

5 |> inc |> square |> inc |> inc |> square;;
square (inc (inc (square (inc 5))));;

let id x = x;;

id 42;;
id true;;
id "bigred";;

let id' : 'a -> 'a = fun x -> x + 1;;

let id_int' : int -> int = id;;


let id' : 'a -> 'a = fun x -> x + 1;;

let first x y = x;;
let first_int : int -> 'b -> int = first;;
(* let bad_first : int -> 'b -> string = first;;    this is not a valid string *) 


