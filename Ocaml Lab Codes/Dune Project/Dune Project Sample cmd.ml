dune init project Matrix


cd Matrix


dune build


dune build


dune exec Matrix



in bin : dune file contains :

(executable
 (public_name Matrix)
 (name main)
 (libraries matrix))
 
 main.ml is test case 
 

in lib : dune file conatins : 

(library
 (name matrix))

matrix.ml is the ans of the question 

in test:

dune :
 (test
 (name test_Matrix))
 
 
 in Matrix folder : 
 
 maxinput file contains:
 
 
 1 2
1 1 1 1 1
1 0 0 0 0
1 0 1 1 1
1 0 0 0 1
1 1 1 0 1
 
 
