(* NOTE: add appropriate code to get these test cases running. Only
   ONE line of code needed here. Purpose: To open the needed library
   to be able to access the 'run' function.

   DO NOT modify any other line of this file *)

(* TODO *)
open Mazesolver.Mazesolv

let test (fname, startRow, startCol) = 
  try (run (fname, startRow, startCol); Printf.printf "Passed\n") with
  | Failure msg -> Printf.printf "Failed: %s\n" msg

let () = 
  let file1 = "../../../../mat.txt" in
  test (file1, 0, 1);
  test (file1, 0, 0)

