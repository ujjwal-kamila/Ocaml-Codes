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