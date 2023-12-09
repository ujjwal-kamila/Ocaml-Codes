(** 4.3 types and values*)
3.;;
3;;
3.14;;
"ABC";;

(**Expresssions *)
65/60;;  
65 mod 60;;
65/0;;

(**Conversion*)  (**float_of_int ..  when string then use "string.make" *)
float_of_int 2;;
3.14 *. (float_of_int 2);;
0.1 +. 0.2;;
string_of_int 12;;
String.make 1 'z';;
"abc" ^ "def"

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
if 2 > 3 then 5  (**through syntax error*)

(** 4.3.5 "Let expressions "*)
let x = 42;;
let x = 42 in x + 1;;
(let x = 42) + 1 ;; (**through syntax error*)
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
let x = 5 in
((let x = 6 in 6) + 5);;

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