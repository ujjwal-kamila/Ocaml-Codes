(*
  1) Define the type of date and day
  2) define a function which takes a date and returns the day of the week give a day and a date
  3) make a callender hashtable with the date as the key and day as the value
*)
type date = {
  month : int;
  day : int;
  year : int;
}

type day =
    | Sunday
    | Monday
    | Tuesday
    | Wednesday
    | Thursday
    | Friday
    | Saturday

let int_of_day = function
  | Sunday -> 0
  | Monday -> 1
  | Tuesday -> 2
  | Wednesday -> 3
  | Thursday -> 4
  | Friday -> 5
  | Saturday -> 6

let day_of_int = function
  | 0 -> Sunday
  | 1 -> Monday
  | 2 -> Tuesday
  | 3 -> Wednesday
  | 4 -> Thursday
  | 5 -> Friday
  | 6 -> Saturday
  | _ -> failwith "day_of_int"


let is_lipyear (year:int) : bool = if (year mod 4) = 0 then
    if (year mod 100) = 0 then
        if (year mod 400) =0 then true
        else false
    else true
else false;;
    
let days_in_month date = 
    match date.month with
        |1|3|5|7|8|10|12 -> 31
        |4|6|9|11 -> 30
        |2 -> if (is_lipyear date.year) then 29 else 28
        |_ -> failwith "days_in_month"

(* let count_from_jan1 date  = 
let mon = date.month  in
    let rec month_in_days acc month =
        let tmp = {month = month ; day = 0; year = date.year} in
        match month with
        |0 -> acc
        |m ->(month_in_days (acc + month_to_day tmp) (m-1))
    in
    month_in_days 0 (mon-1) + date.day *)


let dec_month date =
    {month = date.month -1; day = date.day; year = date.year}

let rec count_from_jan1 acc date =
    match (date.month-1) with
    | 0-> acc + date.day
    | m-> count_from_jan1 (acc+ days_in_month date) (dec_month date)

let rec count_from_jan1 acc date =
    if (date.month = 0) then acc + date.day else count_from_jan1 (acc+ days_in_month date) (dec_month date)
let what_day day diff =
    let d = int_of_day day in
    let day_int = ((diff mod 7) + d) mod 7 in
    day_of_int day_int
    

let date_to_weekday date1 day  date2 =
    let diff = count_from_jan1 0 date2 - count_from_jan1 0 date1 in
    what_day day diff


let from_jan1 day date = 
    let d = {month = 1; day = 1; year = date.year} in
    date_to_weekday d day date



let make_callender day year =
   let h = Hashtbl.create 100 in
    let rec add month n =
        let tmp = {month = month ; day = n; year = year} in
    match month with
        | a when (a <= 12 && n <= days_in_month tmp) ->
                Hashtbl.add h tmp (from_jan1 day tmp) ;
            add (month) (n+1)
        |a when (a <= 12 && n > days_in_month tmp) -> add (month+1) 1
        | _ -> h
    in
    add 1 1