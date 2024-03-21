(* 6.5 Beyond Lists *)
(* Define a binary tree with nodes containing a value of type 'a and two children *)
type 'a tree =
  | Leaf 
  | Node of 'a * 'a tree * 'a tree;; 

  (* 6.5.1. Map on Trees *)
(* Define a function to map over all elements of a tree *)
let rec map_tree f = function
  | Leaf -> Leaf
  | Node (v, l, r) -> (* If the tree is a node *)
      Node (f v, map_tree f l, map_tree f r);; (* Apply the function 'f' to the value of the node and recursively map over left and right subtrees *)


(* 6.5.2. Fold on Trees *)
(* Define a custom list type called mylist with two constructors: Nil for an empty list and Cons for a list node containing a value and a reference to the next element *)

type 'a mylist =
  | Nil
  | Cons of 'a * 'a mylist;;
let rec fold_mylist f acc = function
  | Nil -> acc
  | Cons (h, t) -> f h (fold_mylist f acc t)  (* Apply function f to the head element and the result of recursively folding the tail of the list *)


  (* fold function on trees : *)
  let rec fold_tree f acc = function
  | Leaf -> acc
  | Node (v, l, r) -> f v (fold_tree f acc l) (fold_tree f acc r)