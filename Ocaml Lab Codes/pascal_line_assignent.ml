let nxt_pl lst  = let rec add pre acc =  function
[] -> acc
|h::[] -> (h+0)::(h+pre)::acc
|h::t ->  add h ((h+pre)::acc) t  in 
add 0 [] lst;;

let pascal_lines n = let rec make_lst count acc lst = if count <= 0 then acc else make_lst (count - 1) (lst :: acc) (nxt_pl lst) in 
List.rev (make_lst n [[1]] [1;1]);;

let print_lst lst = let x = let stg_lst lst  = List.map (fun a -> string_of_int a) lst in  List.fold_right (fun a b ->  ( a ^ " " ^ b)) (stg_lst lst)  "" in print_string x ;;
(* val print_lst : int list -> unit = <fun> *)

let print_lst_lst lst = List.iter (fun a -> print_lst a ; print_string "\n") lst  ;;
let print_pascal_lines n = print_lst_lst (pascal_lines n);;
(* val print_pascal_lines : int -> unit = <fun> *)
print_pascal_lines 20;;
