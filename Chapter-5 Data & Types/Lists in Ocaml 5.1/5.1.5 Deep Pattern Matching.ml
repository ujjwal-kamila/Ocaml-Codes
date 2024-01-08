(* 5.1.5. Deep Pattern Matching *)

(**_ :: []*)  .... (*matches all lists with exactly one element*)

(**_ :: _ *) ....(*matches all lists with at least one element*)

(**_ :: _ ::: []*) ....(*matches all lists with exactly two elements*)

(**_ :: _ :: _ :: _ *) ....(*matches all lists with at least three elements*)