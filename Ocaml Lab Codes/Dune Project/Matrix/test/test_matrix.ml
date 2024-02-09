open Matrix

let assert_position expected actual msg =
  if expected = actual then
    Printf.printf "Test passed: %s\n" msg
  else
    Printf.printf "Test failed: %s\nExpected: (%d, %d)\nActual: (%d, %d)\n"
      msg (fst expected) (snd expected) (fst actual) (snd actual)

let test_case_1 () =
  let mat_file = "mat_test" in
  let mat_lines = read_file mat_file in
  let starting_position = Scanf.sscanf (List.hd mat_lines) "%d %d" (fun x y -> (x, y)) in

  let to_int_list line =
    List.map (fun c -> if c = ' ' then None else Some (int_of_char c - int_of_char '0')) (List.of_seq (String.to_seq line))
  in

  let mat_array =
    Array.of_list
      (List.map (fun line ->
        Array.of_list (List.filter_map (fun c -> c) (to_int_list line))
      ) (List.tl mat_lines))
  in

  let () =
    play starting_position mat_array
  in
  let expected_output = (4, 3) in

  assert_position expected_output starting_position "Test Case 1"

let () =
  test_case_1 ()
