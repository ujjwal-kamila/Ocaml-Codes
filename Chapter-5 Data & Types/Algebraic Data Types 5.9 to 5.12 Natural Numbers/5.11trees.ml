(* 5.11 Example: Trees  :-5.11.1 Representation with Tuples *)

(*sample example of tree *)
type 'a tree =
| Leaf
| Node of 'a * 'a tree * 'a tree
(*example :
      2
     / \
    1   3  *)
let  t = 
Node (2,Node(1,Leaf,Leaf),Node (3,Leaf,Leaf))
(* Here is a definition for a binary tree data type: *)
type 'a tree =
| Leaf
| Node of 'a * 'a tree * 'a tree
(*Compare this definition to the definition of a list and notice how similar their structure is: *)
type 'a mylist =
| Nill 
| Cons of 'a * 'a mylist;;

(* Here is code that constructs a small tree: *)
(* the code below constructs this tree:
         4
       /   \
      2     5
     / \   / \
    1   3 6   7
*)
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
  );; (* For example, the size of tree t above is 7. *)
  (* The size of a tree is the number of nodes in it (that is, Nodes, not Leafs*)

  (* Here is a function size : 'a tree -> int that returns the number of nodes in a tree: *)
  let rec size = function
  | Leaf -> 0
  | Node (_, l, r) -> 1 + size l + size r;;
size t;;
(*sum of the tree*)
let rec sum = function
  | Leaf -> 0 
  | Node (v,l,r) -> v + sum l + sum r;; 
  sum t;;



(* 5.11.2 Representation with Records *)
  type 'a tree =
  | Leaf
  | Node of 'a node

and 'a node = {
  value: 'a;
  left: 'a tree;
  right: 'a tree
}

(* Here’s an example tree: *)
(* represents
      2
     / \
    1   3  *)
    let t =
      Node {
        value = 2;
        left = Node {value = 1; left = Leaf; right = Leaf};
        right = Node {value = 3; left = Leaf; right = Leaf}
      };;

(* We can use pattern matching to write the usual algorithms for recursively traversing trees. For example, here is a recursive search over the tree: *)
(** [mem x t] is whether [x] is a value at some node in tree [t]. *)
let rec mem x = function
  | Leaf -> false
  | Node {value; left; right} -> value = x || mem x left || mem x right

(* Here’s a function that computes the preorder traversal of a tree *)
let rec preorder = function
  | Leaf -> []
  | Node {value; left; right} -> [value] @ preorder left @ preorder right;;
preorder t ;;
(*in upper funtion ,it takes quadratic time on unbalanced trees because of
the @ operator.*)

(* That problem can be solved by introducing an extra argument acc to accumulate the values at each node *)


(* 5.12 Example: Natural Numbers *)
(* Peano natural numbers representation  *)
type nat = Zero | Succ of nat;;
(* This allows us to build expressions that have an arbitrary number of nested Succ constructors. Such values act like natural numbers *)
let zero = Zero
let one = Succ zero
let two = Succ one
let three = Succ two
let four = Succ three
let five = Succ four
(* Now we can write functions to manipulate values of this type *)
(* Check if the given Peano natural number is Zero *)
let iszero = function
  | Zero -> true
  | Succ _ -> false;; (*always false except "zero"*)

iszero zero;;
iszero one;;
iszero five;;

(* Get the predecessor of the given Peano natural number*)
let pred = function
  | Zero -> failwith "pred Zero is undefined"
  | Succ m -> m;;
(* pred zero;; *)  (*Exception:-> fail with*)
pred one;;
pred two;;
pred four;;
pred five;;

(*Similarly, we can define a function to add two numbers:*)
(* Recursive function to add two natural numbers *)
let rec add n1 n2 =
  match n1 with
  | Zero -> n2 (*If n1 is zero, return n2 *)
  | Succ pred_n ->(* If n1 is a successor *)
    add pred_n (Succ n2);;(* Recursively add predecessor of n1 and successor of n2 *)
add one two;;
add two three;;

(*We can convert nat values to type int and vice-versa*)
(* Function to convert nat values to type int *)
let rec int_of_nat = function
  | Zero -> 0(*Zero corresponds to 0 in int *)
  | Succ m -> 1 + int_of_nat m;; (* Recursively convert Successor to 1 plus the converted value of its predecessor *)
int_of_nat one;;
int_of_nat three;;
int_of_nat five;;

  (* Function to convert int values to type nat *)
let rec nat_of_int = function
  | i when i = 0 -> Zero(* 0 in int corresponds to Zero in nat *)
  | i when i > 0 -> Succ (nat_of_int (i - 1))(*Recursively convert positive integers by creating Successors *)
  | _ -> failwith "nat_of_int is undefined on negative ints";;(* Error case: nat_of_int is undefined on negative ints *)
nat_of_int 0;;
nat_of_int 5;;
nat_of_int 10;;

(* To determine whether a natural number is even or odd, we can write a pair of mutually recursive functions: *)

(* Define a mutually recursive pair of functions to check if a natural number is even or odd *)
  let rec even = function
| Zero -> true (*Zero is an even number *)
| Succ m -> odd m (*Rec case:If m is odd, then n (Succ m) is even*)

and odd = function
| Zero -> false (*Zero is not an odd number *)
| Succ m -> even m;;(*Rec case:If m is even, then n (Succ m) is odd*)
even two;;
even three;;
odd one;;
odd four;;