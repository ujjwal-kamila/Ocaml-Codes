(* 6.6 Pipelining *)

let sum_sq n =
  let rec loop i sum =
    if i > n then sum
    else loop (i + 1) (sum + i * i)
  in loop 0 0;;

  sum_sq(5);;  (*calculate sum of squares upto 5*)