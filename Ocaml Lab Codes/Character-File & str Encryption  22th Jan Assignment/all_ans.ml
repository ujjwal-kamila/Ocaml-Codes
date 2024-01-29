(**Question 1 *)

let enc (c:char) (off:int) : char =
  match c with
  | 'a'..'z' -> char_of_int (((int_of_char c - int_of_char 'a' + off) mod 26 + 26) mod 26 + int_of_char 'a')
  | 'A'..'Z' -> char_of_int (((int_of_char c - int_of_char 'A' + off) mod 26 + 26) mod 26 + int_of_char 'A')
  | _ -> c;;
  
(* Test Cases  *)
  enc 'A' 130;;     (** - : char = 'A' *)
  enc 'a' 5;;	    (** - : char = 'f' *)
  enc 'A' (-5);;
  
  
(**Question 2 *)

let encstr (s:string) (off:int): string = String.map (fun c -> enc c off) s;;

 (* Test Cases  *) 
 encstr "Ujjwal" 100;;
 encstr "Ocaml" 5;;
 encstr "Ppl" (-10);;
 

(**Question 3 *)

let encfile (s:string) (off:int) : unit =
  let infile = open_in s in
  let outfile = open_out (s ^ ".enc") in
  try
    while true do
      let c = input_char infile in
      output_char outfile (enc c off);
    done
  with End_of_file ->
    close_in infile;
    close_out outfile;;
    
 (* Test Cases  *) 
encfile "new" 10 ;;
encfile "file" 10 ;;
