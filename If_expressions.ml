(*The Basics of Ocaml*)
(*Printing Hello World*)
print_endline "Hello World:)";;
let _ = print_endline "Hello world!";;

3110;;
2110;;
(*Let defination*)
let x = 2110;;  
let y = 3.14;;

(*increment function & fun call*)
let increment x = x+1;;
increment 0;;
increment 5;;
increment 10;;

(*Loading code in utop/Toplevel we have to run "#use "hello.ml""*)
(** #use "code.ml"*)
(**#use "If_expressions.ml" *)


(* Storing code in files in ocaml *)
(*use vs code or vim editor to create a.ml and go to the directory and run in terminal then run the below command *)
(**"ocamlc-o a.byte a.ml" then enter and  run  "./a.byte" to print or run *)

(**Dune project *)
(**create hello.ml and dune (put "executable enter name hello")
		Create a file dune project and put (lang dune 3.4)then run belo comands *)
		(*dune build hello.exe
		dune exe ./hello.exe*)
	(**for clean and reuse use "dune clean"*)
(**Expressions : operators "+","-","*","/","and","mod",*)
65/60;;
65 mod 60;;
65/0;; (* zero divisable error *)
3.;;
4.56;;
3.14 *. 2.5;;


(**Conversion*)  (**float_of_int ..  when string then use "string.make" *)
float_of_int 2;;
3.14 *. (float_of_int 2);;
0.1 +. 0.2;;
string_of_int 12;;
String.make 1 'z';;
"abc" ^ "def";;

(** 4.3.1  "0 based index system like C "*)
"abc".[0];;
"abc".[3];;

(** 4.3.2 More operators  "Equality" *)
 (**physical equality "==,!=" *)
4==5;;  
10!=10;;
"hi"=="hi";;

(**Structual equality " =,< > "*)
40=40;;
"hi"="hi";;
5<>5;;

(** 4.3.4  "If expressions "*)
if 3 + 5 > 2 then "true!" else "false!";;
4 + (if 'a' = 'b' then 1 else 2);;
(*if 2 > 3 then 5  it through syntax error*)

(** 4.3.5 "Let expressions "*)
let x = 42;;
let x = 42 in x + 1;;
(*let x = 42) + 1 ;; through syntax error*)
(let x = 42 in x) + 1;;

(**Let binding*)
let a = "big";;
let b = "red";;
let c = a ^ b;;

(** 4.3.6 "  Scope "*)
let x = 100 in
(* y is not meaningful here *)
x + (let y = "3000" in
(* y is meaningful here *)
int_of_string y)
(** Using Function*)
(**overlapping bindings*)
let x = 5 ;;
((let x = 6 in 6) + 5);; (**warning unused variable x*)

let f x = x * x;;
let f y = y * y;;

f 4;;
f 5;;

let x = 5 in
((let x = 6 in x) + x);;

let x = 5 in (let x = 6 in x) + x;;


let x = 5 in (let y = 6 in y) + x;;

let x = 42;;
let x = 22;;






if 5>3 then "true" else "false";;
