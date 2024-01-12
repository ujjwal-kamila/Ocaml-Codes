(* 5.3.1 An Example of OUnit *)
(* run below commands  in terminal  *)
(***-> $dune build test.exe
  -> $dune exec ./test.exe **)

(* Now suppose we modify sum.ml to introduce a bug by changing the code in it to the following: *)

(**let rec sum = function
| [] -> 1 (* bug *)
| x :: xs -> x + sum xs*)
