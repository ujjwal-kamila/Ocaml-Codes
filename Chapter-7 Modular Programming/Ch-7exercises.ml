(* Exercise: complex synonym [★] *)
(* module type ComplexSig = sig
  type t =  float*float
  val zero : float * float
  val add : t * t * t
end;; *)


(* Exercise: complex encapsulation [★★] *)
(*
ERROR
ERROR
ERROR
*)

(* Exercise: fraction [★★★] *)

module type Fraction = sig
  (* A fraction is a rational number p/q, where q != 0.*)
  type t

  (** [make n d] is n/d. Requires d != 0. *)
  val make : int -> int -> t

  val numerator : t -> int
  val denominator : t -> int
  val to_string : t -> string
  val to_float : t -> float

  val add : t -> t -> t
  val mul : t -> t -> t
end
(*creating structure*)
module PairFraction: Fraction = struct
  type t = int * int
  let make n d =
    assert (d != 0);
    (n,d)
  let numerator (n,d) = n
  let denominator (n,d) = d
  let to_string (n,d) =
    string_of_int n ^ " / " ^ string_of_int d
  let to_float (n,d) =
    float_of_int n /. float_of_int d
  let rec gcd a b =
  if b = 0 then a
  else gcd b (a mod b)
  let add (n1,d1) (n2,d2) =
   let rec gcd a b =
  if b = 0 then a
  else gcd b (a mod b) in
    let n'=(n1*d2+n2*d1)/(gcd (n1*d2+n2*d1) (d1 * d2)) in
    let d' = (d1 * d2) / (gcd (n1*d2+n2*d1) (d1 * d2)) in
    (n', d')
  let mul (n1,d1) (n2,d2) =
    (n1 * n2 / gcd (n1*n2) (d1*d2), d1 * d2 / gcd (n1*n2) (d1*d2))
end;;
(*test case*)
open PairFraction;;
let a =PairFraction.make 5 12;;
let b = PairFraction.make 5 12;;
let c = PairFraction.add a b;;
to_string c;;

(* Exercise: date order [★★] *)
type date = {month : int; day : int}

module Date = struct
type t = date 

  let compare d1 d2 = 
    let month_dif = d1.month - d2.month in
    if month_dif = 0 then d1.day - d2.day
    else month_dif  
end;;







let rec h n pp p =
  if n = 1 then p          (* Base case: if n is 1, return the current value of p *)
  else h (n-1) p (pp+p)   (* Recursive case: calculate the next Fibonacci number *)

(*
   Function to calculate the nth Fibonacci number efficiently
   It uses the helper function 'h' to calculate Fibonacci numbers recursively
   It returns 0 if n is 0, and uses 'h' to calculate the Fibonacci number for n > 0
*)
let fib_fast n =
  if n=0 then 0         (* Base case: if n is 0, return 0 (first Fibonacci number) *)
  else h n 0 1          (* For n > 0, start calculating Fibonacci number using 'h' with initial values *)
