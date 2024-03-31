
(* Put the appropriate call to the 'run' function (that you wrote in
   mazesolv.ml in ../lib folder) to execute your program.

   NOTE: No other function should be defined in this file *)

   open Mazesolver.Mazesolv

   let () =
     let (fname, row, col) = get_parameters () in
     run (fname, row, col)
   

