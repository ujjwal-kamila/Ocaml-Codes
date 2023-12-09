String.sub;;
let f ~name1:arg1 ~name2:arg2 = arg1 + arg2;;
f ~name2:3 ~name1:4;;

let f ~name1:name1 ~name2:name2 = name1 + name2;;
let f ~name1 ~name2 = name1 + name2;;