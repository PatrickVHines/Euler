-module(euler_erlang_server).
-export([run_all/0]).

-spec run_all().
run_all() ->
	run_001().

-spec run_001().
run_001() ->
	problem_1:run().
