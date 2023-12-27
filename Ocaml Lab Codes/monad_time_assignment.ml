module type Monad = sig
  type 'a t
  val return : 'a -> 'a t
  val ( >>= ) : 'a t -> ('a -> 'b t) -> 'b t
end;;

module TimeWriter : Monad = struct
  type 'a t = float * 'a * string

  let return x = (0.0, x, "")

  let ( >>= ) m f =
    let (x, a, s1) = m in
    let (z, b, s2) = f a in
    (x +. z, b, s1 ^ s2)
end;;
open TimeWriter 

let log name f = 
  let start = Sys.time() in 
  fun x y -> 
    let result = f x y in
    let stop = Sys.time() in
    let diff = stop -. start in
    (diff, result, Printf.sprintf "Called %s for %f; " name diff);;

let time name f a d = 
      let start = return ("", "") in
      start >>=
      fun (result, log_message) ->
      let (time, result, log_message) = log name f a d in
      print_endline log_message;
      return (time ,result, log_message);;
         
      let average_time name f  a d n =
        let rec loop acc i =
          if i = 0 then return acc
          else
            time name f a d >>= fun (time,_, _) ->
            loop (acc +. time) (i - 1)
        in
        loop 0.0 n >>= fun total ->
        return (total /. float_of_int n);;
       

        let average_time name f a d n =
          let rec loop acc i =
          if i = 0 then return acc
          else
           time name f a d >>= fun (time, result, log_message) ->
           loop (acc +. time) (i - 1)
          in
          loop 0.0 n >>= fun total ->
          let average = total /. float_of_int n in
          print_endline (Printf.sprintf "Average time: %f" average);
          return average;;

        let amount 100
        let denominations =  [1;2;5;10;20;50;100];;

        