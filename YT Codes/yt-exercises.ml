(*Exercise 1 : Write a function named circle area it will take in argument 'r'(radius) and returns the area of the circle *)

let circle_area (r: float):float = 
  3.14 *. r *. r;; 

  (*Exercise 2 write a power function named power that takes in a power 'n' and a float 'x' and returns x^n *)

  let rec power (n:int) (x:float): float =
    if n = 0 then 1.0
    else x *. power (n-1) x;;

    (*another power function for type (int)*)
    let rec pow x y = 
      if y = 0 then 1 else
         x * pow x(y-1);;

  (*Exercise 3 : Write a function named gcd that computes the greatest common divisior of two positive integers  *)
  (*if 12 8 then gcd is 4 *)
  let gcd (x: int) (y: int): int =
    let min = if x<y then x else y
  in
  let rec dec m = 
    if x mod m = 0 && y mod m = 0 
      then m 
  else dec (m-1)
  in
  dec min;;


