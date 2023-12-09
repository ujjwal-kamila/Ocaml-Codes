let rec fact n = if n = 0 then 1 else n * fact (n - 1);;
fact 10;;

(** [pow x y] is [x] to the power of [y].
Requires: [y >= 0]. *)
let rec pow x y = if y = 0 then 1 else x * pow x (y - 1);;
pow 2 5;;



(** [even n] is whether [n] is even.
Requires: [n >= 0]. *)
let rec even n =
  n = 0 || odd (n - 1)
  (** [odd n] is whether [n] is odd.
  Requires: [n >= 0]. *)
  and odd n =
n <> 0 && even (n - 1);;