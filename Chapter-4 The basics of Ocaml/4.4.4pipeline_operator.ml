(**Pipeline operator " |> "*)
(**Square function using pipeline |> *)
let square x = x * x;;
(**Increment function using pipeline |> *)
let inc = fun x -> x + 1;;
square (inc 5);;
5 |> inc |> square;;
5 |> inc |> square |> inc |> inc |> square;;
square (inc (inc (square (inc 5))));;
