(*7.4 Encapsulation *)
(* 7.4.1. Opacity *)
module Math = struct
  (** [fact_aux n acc] is [n! * acc]. *)
  let rec fact_aux n acc =
    if n = 0 then acc else fact_aux (n - 1) (n * acc)

  (** [fact n] is [n!]. *)
  let fact n = fact_aux n 1
end;;
Math.fact_aux 5 1;;

(* One way to hide it is simply to nest fact_aux: *)
module Math = struct
  (** [fact n] is [n!]. *)
  let fact n =
    (** [fact_aux n acc] is [n! * acc]. *)
    let rec fact_aux n acc =
      if n = 0 then acc else fact_aux (n - 1) (n * acc)
    in
    fact_aux n 1
end;;
Math.fact 5;;


 (*create structure module of MATH*)
 module type MATH = sig
  (** [fact n] is [n!]. *)
  val fact : int -> int
end

module Math = struct
  (** [fact_aux n acc] is [n! * acc]. *)
  let rec fact_aux n acc =
    if n = 0 then acc else fact_aux (n - 1) (n * acc)

  let fact n = fact_aux n 1
end

module MathCheck : MATH = Math

