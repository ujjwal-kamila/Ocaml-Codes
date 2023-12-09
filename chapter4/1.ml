let _ = print_endline "Hello World Wellcome to The Ocaml:)";;
let inc x = x + 1  ;;(* increment funtion*)
inc 5;;

let x = 42 in
(* y is not meaningful here *)
x + (let y = "3110" in
(* y is meaningful here *)
int_of_string y);;








