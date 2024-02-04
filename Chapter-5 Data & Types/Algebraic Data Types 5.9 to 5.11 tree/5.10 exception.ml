(* 5.10 Exceptions *)
(* syntax: "exception E of t" *)
(* For example : *)
exception A
exception B
exception Code of int
exception Details of string;;

(* To create an exception value in OCaml, use variant syntax; for instance, an exception with constructor "Failure" carrying a string can be defined like this. *)
Failure "something went wrong";;

(* To raise an exception value e, simply write *)
(* raise e *)

(* To catch an exception, use this syntax: *)
(** try e with
| p1 -> e1
| ...
| pn -> en *)

(* 5.10.1 Exceptions are Extensible Variants *)
(* : Exception values in OCaml have type exn, which is an extensible variant, allowing the addition of new constructors even after the initial definition of the variant type. *)

(* 5.10.2. Exception Semantics *)
let _ = raise A in raise B;;
(* actually be applied as a function to an argument: *)
(** (raise B) (raise A)
(raise A, raise B)  *)

(* exception with let expression*)
let a = raise A in
let b = raise B in
(a, b);;

(* One interesting corner case is what happens when a raise expression itself has a subexpression that raises:*)
exception C of string;;
exception D of string;;
raise (C (raise (D "oops")));;

(*with try expression*)
(*** try e with
| p1 -> e1
| ...
| pn -> en *)

(* 5.10.3 Pattern Matching *)
match List.hd [] with
| [] -> "empty"
| _ :: _ -> "nonempty"
| exception (Failure s) -> s

(* In general, exception patterns are a kind of syntactic sugar. Consider this code: *)
(*** match e with
  | p1 -> e1
  | ...
  | pn -> en *)

  (* 5.10.4 Exceptions and OUnit *)
(**** open OUnit2
let tests = "suite" >::: [
    "empty" >:: (fun _ -> assert_raises (Failure "hd") (fun () -> List.hd []));
  ]

let _ = run_test_tt_main tests *)