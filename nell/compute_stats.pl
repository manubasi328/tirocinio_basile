:- use_module(library(liftcover)).

:- [train].

:-lift.

:- set_lift(verbosity,5).
:- set_lift(parameter_learning,em_torch).
:- set_lift(processor,gpu).
:- set_lift(threads,2).

:- initialization(main,main).
main:-
  read_rules_anyburl('learn/anyburl-rules.txt', R),
  compute_stats_pos_kg(R,'stats.pl').

