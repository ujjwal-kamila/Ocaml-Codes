(* Exercise: values [★] *)

7 * (1 + 2 + 3);;
"CS " ^ string_of_int 3110;;

(* Exercise: operators [★★] *)

42*10;;
3.14 /. 2.0;;

(* Exercise: equality [★] *)
42 = 42 ;;
"hi"="hi";;
"hi"=="hi";;

(* Exercise: equality [★] *)
assert true;;
assert false;;

(* Exercise: if [★] *)
if 2>1 then 42 else 7;;

(* Exercise: double fun [★] *)
let double y = 2 * y;;
double 7;;

(* Exercise: more fun [★★] *)
let cube i