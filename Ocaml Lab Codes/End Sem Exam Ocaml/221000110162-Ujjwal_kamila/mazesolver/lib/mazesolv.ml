(** This file [mazesolv.ml] provides the [Mazesolv] module inside the
    [Mazesolver] module *)

open Readmaze
(* NOTE: You have to complete the functions below with your own
   code. Parts you need to replace are the regions indicated with

   () (* TODO *)

   Replace those parts with your own code *)



(** [solvemaze maze (entryrow, entrycol)] tries to find an exit point
    starting from the entry point to the maze (which is a 2D matrix of
    0s and 1s) indicated by the cell [(entryrow, entrycol)], i.e.,
    [maze.(entryrow).(entrycol)].

    If no exit point is found, it returns [None], otherwise it returns
    [Some x] where [x] is a tuple indicating the found exit point. 

    If entry point provided is invalid (the cell is not open, i.e.,
    it's value is not 0), then it fails with [failwith "Invalid Entry
    Point"] *)
(* let solvemaze (maze:int array array) ((entryrow, entrycol):(int * int)): (int * int) option =
  let res = Stack.create () in
  let start = Some (entryrow, entrycol) in
  let border_ele mat pos =
    match pos with
    | Some (x, y) -> x <= 0 || x >= (Array.length mat - 1) || y <= 0 || y >= (Array.length mat.(0) - 1)
    | None -> false in
  let rec helper (x, y) =
    try
      if maze.(x).(y) = 0 then
        if (border_ele maze (Some (x, y))) && (Some (x, y) <> start) then
          Stack.push (Some (x, y)) res
        else
          (maze.(x).(y) <- 1;
          helper (x, y + 1);
          helper (x + 1, y);
          helper (x, y - 1);
          helper (x - 1, y);)
      else ()
    with Invalid_argument _ -> ()
  in
  helper (entryrow, entrycol);
  match Stack.pop_opt res with
  | None -> None
  | Some (Some (x, y)) -> Some (x, y)
  | Some None -> None
;; *)

let solvemaze (maze:int array array) ((entryrow, entrycol):(int * int)): (int * int) option =
  let start = (entryrow, entrycol) in
  let border_ele (x, y) =
    x = 0 || x = (Array.length maze - 1) || y = 0 || y = (Array.length maze.(0) - 1)
  in
  let rec helper (a:int * int): (int * int) option =
    let (p, q) = a in
    if p < 0 || p >= Array.length maze || q < 0 || q >= Array.length maze.(0) || maze.(p).(q) <> 0 then
      None
    else if border_ele (p, q) && (a <> start) then
      Some (p, q)
    else begin
      maze.(p).(q) <- 1;
      match helper (p, q + 1) with
      | Some res -> Some res
      | None -> match helper (p + 1, q) with
                | Some res -> Some res
                | None -> match helper (p, q - 1) with
                          | Some res -> Some res
                          | None -> helper (p - 1, q)
    end
  in
  helper (entryrow, entrycol)
  


(** [usage ()] simply prints a message indicating how to use this
    program assuming the user has not invoked this program with the
    proper argument(s) *)
let usage () = 
  Printf.printf 
    "Invalid/Missing argument(s). Usage:\n%s <fname> <entry_row> \
     <entry_col>\nwhere <fname> is the name of the file containing the \
     maze in the required format, <entry_row> and <entry_col> is the \
     maze entry point.\n " Sys.argv.(0)



(** [get_parameters ()] reads the 3 parameters which the user is
    supposed to call this program with from the command line. The
    first argument is the filename containing the matrix representing
    the maze in the required format, the second and third arguments
    are supposed to be the row and column number for the entry point
    to the maze. Thus, the return type for this function is:
    [(string*int*int)]

    In case any argument is/are missing, or extra arguments are
    provided, it prints a usage message and exits with a [Failure
    "Wrong Input"] exception *)
let get_parameters (): (string * int * int) = 
  if Array.length Sys.argv <> 4 then (
    usage ();
    exit 1
  ) else (
    let fname = Sys.argv.(1) in
    let row = int_of_string Sys.argv.(2) in
    let col = int_of_string Sys.argv.(3) in
    (fname, row, col)
  )


(** [run (fname, row, col)] uses the filename and the entry point
    [row], [col] pair obtained from [get_parameters] to call
    [mat_of_file] function in the [readmaze.ml] file to read the
    matrix from the provided file, and the [solvemaze] function with
    the appropriate parameters to find the exit point.

    If no exit point is found, it prints an appropriate one line
    message. If a solution is found, it prints an appropriate message
    with the row column pair for the exit point found. *)
    let run (fname, row, col) = 
      let _, _, maze = mat_of_file fname in
      Printf.printf "Maze provided is:\n";
      print_maze maze;
      Printf.printf "Entry point provided: (%i, %i)\n" row col;
      match solvemaze maze (row,col) with
      | None -> Printf.printf "Maze has no solution for the given entry point\n"
      | Some (r,c) -> Printf.printf "Maze has at least one exit point \
                                     found at (%i, %i)\n" r c;;
                                     
