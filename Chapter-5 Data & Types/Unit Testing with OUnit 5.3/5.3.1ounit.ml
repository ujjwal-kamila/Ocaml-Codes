let tests = "test suite for sum" >::: [
"empty" >:: (fun _ -> assert_equal 0 (sum []));
"singleton" >:: (fun _ -> assert_equal 1 (sum [1]));
"two_elements" >:: (fun _ -> assert_equal 3 (sum [1; 2]));
]