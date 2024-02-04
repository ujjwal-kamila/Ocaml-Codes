(* Q.1) Write A matrix consisting only 0 and 1. Now consider this matrix as a maze where 1s are the blockades and 0s are the openings. Now Find any possible exit point for player, who will start from entry point(user chosen) and move along the path considering 0 to reach any boundaries or exit points.  *)

(* val solve : int array array -> int * int -> int * int = <fun> *)

(* Q.2) Print the path the Player travelled.(Extension of Q.1) *)

(* Q.3) Extend Q.1 little further to take a input from a input.txt which will consist the original matrix file. *)


(* Function to check if a position is at the boundary *)
  let border_ele mat pos =
    match pos with
    | Some (x, y) -> x <= 0 || x >= (Array.length mat - 1) || y <= 0 || y >= (Array.length mat.(0) - 1)
    | None -> false
  ;;
  
  (* Function to play the game starting from a given position *)
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
            helper (x, y+1);
            helper (x+1, y);
            helper (x, y-1);
            helper (x-1, y);)
          else ()
      with outOfBound -> ()
    in helper (i, j);
    match (Stack.pop_opt res) with
    | None -> None
    | Some x -> x
  ;;
  
  (* Example usage *)
  let mat = [|[|1; 1; 1; 1; 1|]; 
              [|1; 0; 0; 1; 0|];
              [|1; 0; 1; 1; 1|];
              [|0; 0; 0; 0; 1|];
              [|1; 1; 1; 0; 1|]|] in
  let starting_position = (1, 2) in
  play starting_position mat

  (* 
  let rec find_exit matrix (x, y) start =
  if x <= 0 || y <= 0 || x >= Array.length matrix - 1 || y >= Array.length matrix.(0) - 1 then
    Some (start, (x, y))
  else if matrix.(x).(y) = 0 then begin
    matrix.(x).(y) <- 1;
    match find_exit matrix (x, y + 1) start with
    | Some path -> Some path
    | None -> match find_exit matrix (x + 1, y) start with
              | Some path -> Some path
              | None -> match find_exit matrix (x, y - 1) start with
                        | Some path -> Some path
                        | None -> find_exit matrix (x - 1, y) start
  end else None
;;

(* Example usage *)
let mat = [|[|1; 1; 1; 1; 1|]; 
            [|1; 0; 0; 1; 0|];
            [|1; 0; 1; 1; 1|];
            [|0; 0; 0; 0; 1|];
            [|1; 1; 1; 0; 1|]|] in

let starting_position = (1, 2) in
match find_exit mat starting_position starting_position with
| Some (start, exit_point) ->
    Printf.printf "Starting position: (%d, %d)\n" (fst start) (snd start);
    Printf.printf "Exit point: (%d, %d)\n" (fst exit_point) (snd exit_point)
| None -> Printf.printf "No exit point found\n"
 *)