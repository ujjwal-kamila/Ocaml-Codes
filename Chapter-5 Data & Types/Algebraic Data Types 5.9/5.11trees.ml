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
  | Node {value; left; right} -> value = x || mem x left || mem x right;;

(* Here’s a function that computes the preorder traversal of a tree *)
let rec preorder = function
  | Leaf -> []
  | Node {value; left; right} -> [value] @ preorder left @ preorder right;;
preorder t ;;