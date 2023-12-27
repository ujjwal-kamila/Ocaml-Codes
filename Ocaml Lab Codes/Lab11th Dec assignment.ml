(* write a function in ocaml program which takes a string containing 0 or more words (where a word Is a sequence of characters in the range 'a-z' and/or 'A-Z' and returns a list of strings where this strings in the list are the words contained in the provided string (s: string): string list, you may find the following library functions String.to_seq, List.of.seq. String.make, Buffer.create, Buffer.contents *)


let is_letter c =
  let code = Char.code c in
  (code >= 65 && code <= 90) || (code >= 97 && code <= 122)

let get_words (s: string) : string list =
  let rec split_words acc buffer = function
    | [] -> if Buffer.length buffer > 0 then Buffer.contents buffer :: acc else acc
    | hd :: tl ->
      if hd = ' ' && Buffer.length buffer = 0 then
        split_words acc buffer tl
      else if hd = ' ' || not (is_letter hd) then
        let word = Buffer.contents buffer in
        split_words (if word = "" then acc else word :: acc) (Buffer.create 0) tl
      else (
        Buffer.add_char buffer hd;
        split_words acc buffer tl
      )
  in
  s |> String.to_seq |> List.of_seq |> split_words [] (Buffer.create 0) |> List.rev;;
(*sample run*)

get_words "Hii,This is an exaple of a string";;