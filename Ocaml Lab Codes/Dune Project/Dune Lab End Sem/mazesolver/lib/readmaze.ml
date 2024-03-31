(** This file [readmaze.ml] provides the [Readmaze] module contained
    in the [Mazesolver] module *)


(* NOTE: You have to complete the functions below with your own
   code. Parts you need to replace are the regions indicated with

   () (* TODO *)

   Replace those lines with your own code *)



(** [mat_of_file fname] reads the text file [fname] and reads the
    matrix of 0s and 1s from the file and returns a 3-tuple containing
    the rows, columns, and the matrix itself as a 2D Array.

    The text file stores the matrix in the format stated below (and it
    is assumed that the provided file strictly follows the format
    mentioned below, and hence, no error checking is done regarding
    the format of the file):

[<num of rows>
<num of cols>
<row 1 of 0s and 1s (without any space in between)>
<row 2 ...>
...
<last row>] *)



let mat_of_file (fname:string): (int * int * int array array) =
  let ic = open_in fname in
  let num_rows = int_of_string (input_line ic) in
  let num_cols = int_of_string (input_line ic) in
  let maze = Array.make_matrix num_rows num_cols 0 in
  try
    for i = 0 to num_rows - 1 do
      let row = input_line ic in
      for j = 0 to num_cols - 1 do
        maze.(i).(j) <- Char.code row.[j] - Char.code '0';
      done;
    done;
    close_in ic;
    (num_rows, num_cols, maze)
  with e ->
    close_in_noerr ic;
    raise e


(** [print_maze maze] prints the maze which is a 2D matrix of 1s and
    0s to the terminal one row per line *)
let print_maze (maze:int array array): unit =
  Array.iter
    (fun row ->
       (Array.iter
         (fun i -> print_int i; print_char ' ')
         row);
       print_char '\n')
    maze;;


