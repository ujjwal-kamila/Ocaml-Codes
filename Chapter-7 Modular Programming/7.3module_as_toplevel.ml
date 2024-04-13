(* 7.3.1. Loading Compiled Modules *)
let b = "bigred"
let inc x = x + 1
module M = struct
  let y = 42
end

(*put the upper code in mods.ml*)
(*run ocamlc mods.ml
and run : ##load "mods.cmo" in utop     
*)

module Mods = struct
  let b = "bigred"
  let inc x = x + 1
  module M = struct
    let y = 42
  end
end;;

Mods.b;;
Mods.M.y;;

(*increment it*)
Mods.inc
open Mods;;
inc;;


(* 7.3.2. Dune *)
(*dune creation and run in utop
   
"$ dune utop"
Mods.inc
*)

(* 7.3.3. Initializing the Toplevel *)
open Mods;;
inc;;
M.y;;

(*7.3.4. Requiring Libraries *)

(* 
open OUnit2;;
#require "ounit2";;
open OUnit2;; 
*)

(* 7.3.5. Load vs Use *)
(**For use
# #use "mods.ml"
# b;;
# Mods.b;;
*)

(**For load:

# #directory "_build";;
# #load "mods.cmo";;
# Mods.b;;
# b;;

*)


