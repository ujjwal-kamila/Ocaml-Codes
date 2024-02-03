(* 5.10 Exceptions *)
(* syntax: "exception E of t" *)
(* For example : *)
exception A
exception B
exception Code of int
exception Details of string;;

(* To create an exception value in OCaml, use variant syntax; for instance, an exception with constructor "Failure" carrying a string can be defined like this. *)
