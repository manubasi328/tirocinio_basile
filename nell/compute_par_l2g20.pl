:- use_module(library(liftcover)).

:- [train].

:-lift.

:- set_lift(verbosity,5).
:- set_lift(parameter_learning,em_torch).
:- set_lift(processor,gpu).
:- set_lift(threads,2).
:- set_lift(regularization,l2).
:- set_lift(gamma,20).

:- initialization(main,main).
main:-
  read_rules_anyburl('learn/anyburl-rules.txt', R),
  compute_par_kg(R,'stats.pl',R1),
  write_rules_anyburl(R1,'out_lp4kg_torch_lf_l2g20.txt').
