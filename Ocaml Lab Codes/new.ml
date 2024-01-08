module type Monad = sig
  type 'a t
  val return : 'a -> 'a t  (* Function to wrap a value into the monadic context *)
  val ( >>= ) : 'a t -> ('a -> 'b t) -> 'b t  (* Bind operator for sequencing computations *)
end;;

module TimeWriter : Monad = struct
  type 'a t = float * 'a * string  (* Define a tuple type for the monadic value *)

  let return x = (0.0, x, "")  (* Lift a value into the TimeWriter monad with an empty log *)

  (* Bind operator for TimeWriter monad *)
  let ( >>= ) m f =
    let (x, a, s1) = m in
    let (z, b, s2) = f a in
    (x +. z, b, s1 ^ s2)  (* Combines time, result, and log messages *)
end;;

open TimeWriter  (* Expose the TimeWriter module *)

(* Function to log the time taken by another function *)
let log name f = 
  let start = Sys.time() in  (* Record the starting time *)
  fun x y -> 
    let result = f x y in  (* Execute the provided function *)
    let stop = Sys.time() in  (* Record the ending time *)
    let diff = stop -. start in  (* Calculate the time taken *)
    (diff, result, Printf.sprintf "Called %s for %f; " name diff);;  (* Return time, result, and log message *)

(* Function to measure and log time taken by a function, along with its result *)
let time name f a d = 
  let start = return ("", "") in  (* Start the computation with an empty log *)
  start >>=  (* Use bind operator to chain computations *)
  fun (result, log_message) ->
    let (time, result, log_message) = log name f a d in  (* Get time, result, and log message *)
    print_endline log_message;  (* Print the log message *)
    return (time ,result, log_message);;  (* Return time, result, and log message in the monadic context *)

(* Function to compute the average time of a function over multiple runs *)
let average_time name f a d n =
  let rec loop acc i =
    if i = 0 then return acc  (* If the count is reached, return the accumulated time *)
    else
      time name f a d >>= fun (time, _, _) ->  (* Measure time taken by the function *)
      loop (acc +. time) (i - 1)  (* Accumulate time in each iteration *)
  in
  loop 0.0 n >>= fun total ->  (* Perform the loop starting from 0.0 accumulated time *)
    return (total /. float_of_int n);;  (* Return the average time *)

(* Function to compute the average time and display it *)
let average_time name f a d n =
  let rec loop acc i =
    if i = 0 then return acc  (* If the count is reached, return the accumulated time *)
    else
     time name f a d >>= fun (time, result, log_message) ->  (* Measure time taken by the function *)
     loop (acc +. time) (i - 1)  (* Accumulate time in each iteration *)
  in
  loop 0.0 n >>= fun total ->  (* Perform the loop starting from 0.0 accumulated time *)
    let average = total /. float_of_int n in  (* Calculate the average time *)
    print_endline (Printf.sprintf "Average time: %f" average);  (* Print the average time *)
   
