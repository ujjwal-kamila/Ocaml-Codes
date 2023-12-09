	(*Check if Sqaure MAtrix or not*)
	let rec if_square matrix = if (matrix |> List.hd |> List.length) != (matrix |> List.tl |> List.length) then if_square (List.tl(matrix)) else if (matrix |> List.hd |> List.length) = (List.length matrix) then true else failwith "Not a Square Matrix";;
	
	
	(*let length = List.length(matrix) in if length>0 then true else false;;*)
	 
	 let rec del_hd m = match m with
	 |[] -> []
	 |h::m::t -> m :: del_hd t;;
	 
	 let change_hd 
	 
	 let rec add_zero m =match m with
	 |[] -> []
	 |[]::_ -> []
	 |h::t -> (0::List.tl h):: add_zero t;;
	 
	 let rec upt_mt m =match m with
	 |[] -> []
	 |h::t -> h :: upt_mt(del_hd t);;
	 
	 let split_mt = if if_square matrix then 
