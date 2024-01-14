let timed f = 
    let time_sum = ref 0. in
    let time_count = ref 0 in 
    let f' x = 
        let start = Sys.time() in 
        let res  = f x in 
        let stop = Sys.time() in 
        let diff = stop -. start in
        time_sum := !time_sum +. diff ;
        time_count := !time_count + 1 ;
        print_endline (string_of_float !time_sum);
        (res, !time_sum /. (float_of_int !time_count))
    in f'


let rec stack2list s = match Stack.pop_opt s with
    | None -> []
    | Some v -> v::stack2list s;;
(* A stack based implementation of cch *)
let cchstack (amount:int) (denominations:int list): int list list =
    let res = Stack.create () in
    let rec cch a d acc =
        if a<0 then failwith "Invalid Input"
        else if a=0 then (Stack.push acc res)
        else match d with
            | [] -> ()
            | h::t -> (if a>=h
                then ((cch (a-h) d (h::acc));(cch a t acc))
                else (cch a t acc)) in
    cch amount denominations []; stack2list res;;

type a = {amount:int ; denomination: int list};;

let f a = cchstack a.amount a.denomination;;
let ad= {amount = 100 ; denomination = [1;2;5;10;20;50]};;

let rec average n  = 
    let res =  timed f in
    if n = 0 then res ad
    else let _ = res ad in
        average  (n-1);;
let ans (x,y) = y;;

ans (average 100);;

let aver_time n=
let rec loop acc a =
if a=0 then (acc /. float_of_int n) else loop (acc +. ans (timed f ad)) (a-1) in
loop 0.0 n;;