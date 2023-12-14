(* OCaml has built-in printing functions

print_char, print_string,
print_int, and print_float. There’s also a print_endline function, which is like print_string, but
also outputs a newline. *)
print_endline "Hello World";;

(* 4.6.1 Unit *)
print_endline;;
print_string;;

(* 4.6.2 Semicolon *)
let _ =  print_endline "Camels" in
let _ = print_endline "are" in
print_endline"bae";;

(* 4.6.3 Ignore *)
(ignore 10); 5
let ignore x = ();;
let ignore _ = ();;

(* 4.6.4 Printf functions *)
let print_stat name num =
print_string name;
print_string ": ";
print_float num;
print_newline ();;
print_stat "mean" 84.30;;

(* Here’s how we’d use printf to re-implement print_stat: *)
let print_stat name num = 
  Printf.printf "%s: %F\n!" name num;;

(* gives value error *)
(**let print_stat name (num : int) =
Printf.printf "%s: %F\n%!" name num*)

(**change the conversion int, which is %i*)
let print_stat name num =
  Printf.printf "%s: %i\n%!" name num;;

let string_of_stat name num =
  Printf.sprintf "%s: %F" name num;;

  (* 4.7.3 Debugging in OCaml *)
  let inc x = x + 1;;
let inc x =let () = print_int x in x + 1;;

let rec fib x = if x <= 1 then 1 else fib (x - 1) + fib (x - 2);;
#trace fib;;
fib 2;;