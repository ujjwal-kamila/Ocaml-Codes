let rec count n =if n = 0 then 0 else 1 + count (n - 1);;
count 10;;
count 100_000;;
count 1000;

let rec count_forever n = 1 + count_forever n;;

let rec count_forever n = 1 + count_forever n;;

count_forever 4;;   (* Stack Overflow *)

let rec count n =if n = 0 then 0 else 1 + count (n - 1);;

count 8;;
let rec count_aux n acc =if n = 0 then acc else count_aux (n - 1) (acc + 1);;
let count_tr n = count_aux n 0;;

count_tr 1_000_000;;

let rec fact n =if n = 0 then 1 else n * fact (n - 1);;
fact 3;;

let rec fact_aux n acc =if n = 0 then acc else fact_aux (n - 1) (n * acc);;
let fact_tr n = fact_aux n 1;;

fact 50;;

#require "zarith.top";;