(* Exercise: twice, no arguments [★] *)

(* val quad : int -> int
 * val fourth : int -> int
 * quad is a function because twice is a higher-order function that takes
 * a function as argument and returns a function.
*)

(* Exercise: mystery operator 1 [★★] *)
(* [($)] is simply function application: it applies its first argument
 * (which needs to be a function) to its second. Writing [f $ x] seems
 * unnecessary since we could have written [f x], but [($)] is useful
 * for changing the precedence of operators. For example,
 * [square $ 2 + 2] is interpreted as [square (2 + 2) = 16] whereas
 * [square 2 + 2] is interpreted as [(square 2) + 2 = 6].
 *
 * Of course, it's much better to write [2 + 2 |> square], since this
 * makes data flow more explicit.
*)

(* exercise: mystery operator 2 *)
let ( @@ ) f g x = x |> g |> f;;
String.length @@ string_of_int;;
(@@)String.length  string_of_int 1000;;

(* Exercise: repeat [★★] *)
let twice f x = f(f x);;
twice(fun x -> x*2)4;;
let rec repeat f n x =
  if n= 0 then x else repeat f (n-1)(f x);;

repeat (fun x->x+1)5 1;;

(* Exercise: product [★] *)
let product_left lst = List.fold_left(fun x acc -> acc *. x)1.0 lst;;

let product_left lst = List.fold_left ( *. ) 1.0 lst;;
product_left [1.;2.];;
let product_right lst = List.fold_right ( *. )lst 1.0;; 
product_right [1.;5.4];;

(* Exercise: terse product [★★] *)
let product = ListLabels.fold_left ~init:1 ~f:( * );;


(*  exercise: sum_cube_odd *)
let make_lst n = let rec helper n acc = 
  match n with 
  |0 -> acc
  |_-> helper(n-1) (n::acc) in
  helper n[];;

let sum_cube_odd n = 
  let odd_numbers = List.filter(fun x -> x mod 2<>0) (List.init(n+1)(fun i -> i))in
  List.fold_left(fun acc x-> acc+(x*x*x))0 odd_numbers;;

  sum_cube_odd 5;;


(* Exercise: sum_cube_odd pipeline [★★] *)
let make_lst n = List.init (n+1)(fun x-> x);;
make_lst 5;;
let sum_cube_odd_pipe n = n |> make_lst |> List.filter(fun x-> x mod 2<>0) |> List.map(fun x -> x*x*x) |> List.fold_left(+) 0;;
sum_cube_odd_pipe 4;;

(* Exercise: exists [★★] *)
let rec is_exists x = function 
|[]->false
|h::t -> h=x || is_exists x t;;
is_exists 4 [1;2;3;4];;

(*2nd part*)
let exists_fold n lst = List.fold_left(fun acc x -> acc|| x=n )false lst;;
exists_fold 5 [1;2;3;4];;

(* Exercise: account balance [★★★] *)
let balance n lst = n-(List.fold_left(fun acc x -> acc+x)0 lst);;
balance 200 [15;25;50;10];;

(* Exercise: library uncurried [★★] *)
let uncarried_nth (lst,n) = List.nth lst n;;
uncarried_nth ([1;2;3;4],2);;

let uncarried_append (lst1,lst2) = List.append lst1 lst2;;
uncarried_append ([1;2;3] ,[4;5;6]);;

let uncarried_compare (lst1,lst2) = Char.compare lst1 lst2;;
uncarried_compare ('c','A');;
let uncarried_max (lst1,lst2) = Stdlib.max lst1 lst2;;
uncarried_max ([1;2;3] ,[4;2;4;5;67;7]);;

