let border_ele mat pos =
  match pos with
  | Some (x, y) -> x <= 0 || x >= (Array.length mat - 1) || y <= 0 || y >= (Array.length mat.(0) - 1)
  | None -> false
;;

let play (i, j) matrix =
  let res = Stack.create () in
  let start = Some (i, j) in
  let rec helper (x, y) =
    try
      if matrix.(x).(y) = 0 then
        if (border_ele matrix (Some (x, y))) && (Some (x, y) <> start) then
          Stack.push (Some (x, y)) res
        else
          (matrix.(x).(y) <- 1;
          helper (x, y + 1);
          helper (x + 1, y);
          helper (x, y - 1);
          helper (x - 1, y);)
      else ()
    with Invalid_argument _ -> ()
  in
  helper (i, j);
  match Stack.pop_opt res with
  | None -> Printf.printf "No valid position found\n"
  | Some (Some (x, y)) -> Printf.printf "Position found: Some (%d, %d)\n" x y
  | Some None -> Printf.printf "Unexpected None in the stack\n"
;;

let read_file filename =
  let ic = open_in filename in
  let rec read_lines lines =
    try
      let line = input_line ic in
      read_lines (line :: lines)
    with End_of_file ->
      close_in ic;
      List.rev lines
  in
  read_lines []
;;

let mat_run mat_file =
  let mat_lines = read_file mat_file in
  match mat_lines with
  | start_line :: matrix_lines ->
    let starting_position = Scanf.sscanf start_line "%d %d" (fun x y -> (x, y)) in
    Printf.printf "Starting position: %d, %d\n" (fst starting_position) (snd starting_position);

    let to_int_list line =
      List.map (fun c -> if c = ' ' then None else Some (int_of_char c - int_of_char '0')) (List.of_seq (String.to_seq line))
    in

    let mat_array =
      Array.of_list
        (List.map (fun line ->
          Array.of_list (List.filter_map (fun c -> c) (to_int_list line))
        ) matrix_lines)
    in

    Printf.printf "Matrix:\n";
    Array.iter (fun row ->
      Array.iter (fun cell -> Printf.printf "%d " cell) row;
      Printf.printf "\n"
    ) mat_array;

    play starting_position mat_array
  | _ -> Printf.printf "Invalid mat file format\n";;