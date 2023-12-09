print_endline "Hello World";;
print_endline;;
print_string;;
let _ = print_endline "Camels" in
let _ = print_endline "are" in
print_endline "bae";;

let () = print_endline "Camels" in
let () = print_endline "are" in
print_endline "bae";;

print_endline "Camels";
print_endline "are";
print_endline "bae";;

(* ignore 4.6.3 *)

(ignore 3); 5;;

let ignore x = ();;
let ignore _ = ();;

(* 4.6.4 Printf *)

(** [print_stat name num] prints [name: num]. *)
let print_stat name num =
print_string name;
print_string ": ";
print_float num;
print_newline ();;

print_stat "mean" 84.39;;

let print_stat name num =Printf.printf "%s: %F\n%!" name num;;  (*F for float*)
let print_stat name num =Printf.printf "%s: %i\n%!" name num;; (*i for int*)

let string_of_stat name num =Printf.sprintf "%s: %F" name num;;
string_of_stat "mean" 84.39;;