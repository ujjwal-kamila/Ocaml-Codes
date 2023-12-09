let inc x = x + 1;;
let inc x =let () = print_int x in x + 1;;

let rec fib x = if x <= 1 then 1 else fib (x - 1) + fib (x - 2);;
#trace fib;;
fib 2;;