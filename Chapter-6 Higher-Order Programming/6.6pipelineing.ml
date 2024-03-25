(* 6.6 Pipelining *)

let sum_sq n =
  let rec loop i sum =
    if i > n then sum
    else loop (i + 1) (sum + i * i)
  in loop 0 0;;

  sum_sq(5);;  (*calculate sum of squares upto 5*)


  (* Another sample way of producing the same result in OCaml uses higher-order functions and the pipeline operator: *)
  let rec ( -- ) i j = if i > j then [] else i :: i + 1 -- j
  let square x = x * x
  let sum = List.fold_left ( + ) 0
  
  let sum_sq1 n =
    0 -- n              (* [0;1;2;...;n]   *)
    |> List.map square  (* [0;1;4;...;n*n] *)
    |> sum;;          (*  0+1+4+...+n*n  *)
  
  (* Test case *)
  sum_sq1 6;;


(* anohter mehtod: a lot of extra [let..in] syntax and unnecessary names to for intermediate values we don't care out. *)
   let sum_sq2 n =
    let l = 0 -- n in
    let sq_l = List.map square l in
    sum sq_l;;

  (* Test case *)
    sum_sq2 7;;
  
  (* another implementation: have to read the function applications from right to left rather than top to bottom, and extra parentheses. *)
  let sum_sq3 n =
    sum (List.map square (0--n));;

  (* Test case *)
  sum_sq3 4;;

