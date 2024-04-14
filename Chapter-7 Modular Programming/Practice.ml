let rec even n = 
n = 0 || odd(n-1)
and odd n = 
n<> 0 && even (n-1);;
(* val even : int -> bool = <fun>
val odd : int -> bool = <fun> *)
(* odd -1;; *)
(* Error: This expression has type int -> bool
       but an expression was expected of type int *)
(* even -1;; *)
(* Error: This expression has type int -> bool
       but an expression was expected of type int *)
(* even 1.5;; *)
(* Error: This expression has type float but an expression was expected of type
         int *)
let rec even n = 
n = 0 || odd(n-1)
and odd n = 
n<> 0 && even (n-1);;
(* val even : int -> bool = <fun>
val odd : int -> bool = <fun> *)
let sqare n = n*n;;
(* val sqare : int -> int = <fun> *)
2 |> sqare |> sqare;;
(* - : int = 16 *)
(* id 32;; *)
(* Error: Unbound value id *)
let id x =  x;;
(* val id : 'a -> 'a = <fun> *)
id 32;;
(* - : int = 32 *)
id "Ujjwal";;
(* - : string = "Ujjwal" *)
(+);;
(* - : int -> int -> int = <fun> *)
let rec fibonacci n =
  match n with
  | 0 -> 0      (* Base case: Fib(0) = 0 *)
  | 1 -> 1      (* Base case: Fib(1) = 1 *)
  | _ -> fibonacci (n - 1) + fibonacci (n - 2)  (* Recursive case: Fib(n) = Fib(n-1) + Fib(n-2) *)
;;
(* val fibonacci : int -> int = <fun> *)
fibonacci 5;;
(* - : int = 5 *)
(+);;
(* - : int -> int -> int = <fun> *)
(+) 10 12;;
(* - : int = 22 *)
( * ) 10 12;;
(* - : int = 120 *)
let rec factorial n =
  match n with
  | 0 -> 1    (* Base case: Factorial of 0 is 1 *)
  | _ -> n * factorial (n - 1)  (* Recursive case: Factorial of n is n * factorial (n - 1) *)
;;
(* val factorial : int -> int = <fun> *)
factorial 0;;
(* - : int = 1 *)
factorial 1;;
(* - : int = 1 *)
(* let rms x y = ((x ** 2. +. y ** 2.)/2);; *)
(* Error: This expression has type float but an expression was expected of type
         int *)
let rms x y = ((x ** 2. +. y ** 2.)/. 2.);;
(* val rms : float -> float -> float = <fun> *)
(* let valid_date d m =
     if m = "Jan" || "Mar" || "May" || "Jul"
        || "Aug" || "Oct" || "Dec"
     then 1 <= d && d <= 31
     else if m = "Apr" || "Jun" || "Sept" || "Nov"
     then 1 <= d && d <= 30
     else if m = "Feb"
     then 1 <= d && d <= 28
     else false
   ;; *)
(* Error: This expression has type string but an expression was expected of type
         bool *)
type 'a tree =
| Leaf
| Node of 'a * 'a tree * 'a tree;;
(* type 'a tree = Leaf | Node of 'a * 'a tree * 'a tree *)
let t =
  Node(4,
    Node(2,
      Node(1, Leaf, Leaf),
      Node(3, Leaf, Leaf)
    ),
    Node(5,
      Node(6, Leaf, Leaf),
      Node(7, Leaf, Leaf)
    )
  );;let t =
(* val t : int tree =
  Node (4, Node (2, Node (1, Leaf, Leaf), Node (3, Leaf, Leaf)),
   Node (5, Node (6, Leaf, Leaf), Node (7, Leaf, Leaf))) *)
Node(4,
    Node(2,
      Node(1, Leaf, Leaf),
      Node(3, Leaf, Leaf)
    ),
    Node(5,
      Node(6, Leaf, Leaf),
      Node(7, Leaf, Leaf)
    )
  );;
(* - : int tree =
Node (4, Node (2, Node (1, Leaf, Leaf), Node (3, Leaf, Leaf)),
 Node (5, Node (6, Leaf, Leaf), Node (7, Leaf, Leaf))) *)
(**Tree all Traversals*)
type 'a binary_tree =
  | Leaf
  | Node of { value : 'a; left : 'a binary_tree; right : 'a binary_tree }

(* Pre-order traversal: root -> left -> right *)
let rec preorder = function
  | Leaf -> []
  | Node { value; left; right } -> [value] @ preorder left @ preorder right

(* In-order traversal: left -> root -> right *)
let rec inorder = function
  | Leaf -> []
  | Node { value; left; right } -> inorder left @ [value] @ inorder right

(* Post-order traversal: left -> right -> root *)
let rec postorder = function
  | Leaf -> []
  | Node { value; left; right } -> postorder left @ postorder right @ [value]

(* Test cases *)
let binary_tree =
  Node {
    value = 1;
    left = Node { value = 2; left = Leaf; right = Leaf };
    right = Node { value = 3; left = Leaf; right = Leaf };
  }

  (* test case using assert *)
let () =
  assert (preorder binary_tree = [1; 2; 3]);
  assert (inorder binary_tree = [2; 1; 3]);
  assert (postorder binary_tree = [2; 3; 1]);
  print_endline "All test cases passed!"

;;
(* type 'a binary_tree =
    Leaf
  | Node of { value : 'a; left : 'a binary_tree; right : 'a binary_tree; }
val preorder : 'a binary_tree -> 'a list = <fun>
val inorder : 'a binary_tree -> 'a list = <fun>
val postorder : 'a binary_tree -> 'a list = <fun>
val binary_tree : int binary_tree =
  Node
   {value = 1; left = Node {value = 2; left = Leaf; right = Leaf};
    right = Node {value = 3; left = Leaf; right = Leaf}} *)
type 'a tree =
  | Leaf
  | Node of 'a node

and 'a node = {
  value: 'a;
  left: 'a tree;
  right: 'a tree
};;
(* type 'a tree = Leaf | Node of 'a node
and 'a node = { value : 'a; left : 'a tree; right : 'a tree; } *)
let t =
  Node {
    value = 2;
    left = Node {value = 1; left = Leaf; right = Leaf};
    right = Node {value = 3; left = Leaf; right = Leaf}
  }
;;
(* val t : int tree =
  Node
   {value = 2; left = Node {value = 1; left = Leaf; right = Leaf};
    right = Node {value = 3; left = Leaf; right = Leaf}} *)
(** [mem x t] is whether [x] is a value at some node in tree [t]. *)
let rec mem x = function
  | Leaf -> false
  | Node {value; left; right} -> value = x || mem x left || mem x right;;
(* val mem : 'a -> 'a tree -> bool = <fun> *)
let rec preorder = function
  | Leaf -> []
  | Node {value; left; right} -> [value] @ preorder left @ preorder right;;
(* val preorder : 'a tree -> 'a list = <fun> *)
let preorder_lin t =
  let rec pre_acc acc = function
    | Leaf -> acc
    | Node {value; left; right} -> value :: (pre_acc (pre_acc acc right) left)
  in pre_acc [] t;;
(* val preorder_lin : 'a tree -> 'a list = <fun> *)
succ;;
(* - : int -> int = <fun> *)
type nat = Zero | Succ of nat;;
(* type nat = Zero | Succ of nat *)
let zero = Zero
let one = Succ zero
let two = Succ one
let three = Succ two
let four = Succ three;;
(* val zero : nat = Zero
val one : nat = Succ Zero
val two : nat = Succ (Succ Zero)
val three : nat = Succ (Succ (Succ Zero))
val four : nat = Succ (Succ (Succ (Succ Zero))) *)
let iszero = function
  | Zero -> true
  | Succ _ -> false

let pred = function
  | Zero -> failwith "pred Zero is undefined"
  | Succ m -> m;;
(* val iszero : nat -> bool = <fun>
val pred : nat -> nat = <fun> *)
let rec int_of_nat = function
  | Zero -> 0
  | Succ m -> 1 + int_of_nat m

let rec nat_of_int = function
  | i when i = 0 -> Zero
  | i when i > 0 -> Succ (nat_of_int (i - 1))
  | _ -> failwith "nat_of_int is undefined on negative ints";;
(* val int_of_nat : nat -> int = <fun>
val nat_of_int : int -> nat = <fun> *)
