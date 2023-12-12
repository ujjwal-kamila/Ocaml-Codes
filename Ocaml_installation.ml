(* *Ocaml is a Functional programming Language 
*Defines computataions as mathematical functions
*Functions have some side effects *)

(**How to install Ocaml on Ubuntu \ Linux Machine*)
(* You have to run the Below Commands in Terminal [Using Shortcut(CTRL+ALT+T)] *)

1.sudo apt update
2.sudo apt full-upgrade
3.sudo apt install zip unzip build-essential
4.sudo apt install opam
5.opam init--bare -a -y
6.opam switch create pcc-cs301 ocaml-base-compiler 4.14.0
7.opam switch list
8.opam install -y utop odoc ounit2 qcheck bisect-ppx mchir
ocaml-lst-server ocamlformat-rpc
9.utop 
