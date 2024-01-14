let rec stack2list s = match Stack.pop_opt s with
    | None -> []
    | Some v -> v::stack2list s;;

let cchstack amount denominations =
    let (res:(int*int) list Stack.t) = Stack.create () in
    let rec cch a d acc =
        if a<0 then failwith "Invalid Input"
        else if a=0 then Stack.push acc res 
        else match d with
            | [] -> () 
            | h::t -> let q=a/h in
                (for i=1 to q; do
                    cch (a-(h*i)) t ((h,i)::acc)
                done); (cch a t acc)
    in cch amount denominations []; stack2list res;;

module type Monad = 
sig 
    type 'a t 
    val return : 'a -> 'a t 
    val return2 : 'a -> 'b t -> 'a t 
    val convert : ('a -> 'b) -> 'a -> 'b t 
    val extract : 'a t -> float * 'a 
    val ( >>= ) : 'a t -> ('a -> 'b t) -> 'b t 
end;;
module TimeMonad : Monad = struct 

    type 'a t = {v : 'a ; toTime : float ; avgTime: float; runCount : int }

    let return x = {v = x; toTime = 0.0 ; avgTime = 0.0 ; runCount = 0}

    let return2 x {v = res; toTime; avgTime ; runCount} = {v = x; toTime; avgTime ; runCount}

    let convert f = 
        fun x -> 
        let start = Sys.time () in 
        let res = f x in 
        let stop = Sys.time () in 
        let time = stop -. start in
        {v = res; toTime = time ; avgTime = time ; runCount = 1 }

    let extract {v = res; toTime = total ; avgTime = average ; runCount = run} = (average, res)

    let (>>=) m f = 
        let {v = avg; toTime = oldTime ; avgTime = oldAvg ; runCount = oldCount} = m in 
        let {v = res; toTime = newTime ; avgTime = newAvg ; runCount = newCount} = f avg in 
        let time = oldTime +. newTime in 
        let runs = oldCount + 1 in 
        {v = res; toTime = time ; avgTime = time /. (float_of_int runs); runCount = runs }
end ;; 


let multiRun2 = 
    fun f' -> 
    let f = TimeMonad.convert f' in 
    fun x -> 
    let m = TimeMonad.return x in 
    fun n -> 
    let rec checking mot fot n = 
        let rep mo fo = 
            let m1 = TimeMonad.(>>=) mo fo in 
            let m2 = TimeMonad.return2 x m1 in 
            (m1, m2) in 
        let (m1, m2) = rep mot fot in 
        if (n < 1) then (TimeMonad.extract m1) else checking m2 f (n - 1) in 
    checking m f n ;;

multiRun2 (cchstack 2000) [1000;500;200;100;50] 100;;
