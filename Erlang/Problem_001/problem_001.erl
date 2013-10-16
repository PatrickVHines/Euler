-module(problem_001).
-export([run/0]).

-spec run() -> integer().
run() ->
	sum(buildMultiples()).

-spec buildMultiples() -> list().
buildMultiples() ->
	buildMultiples([0],[3,5],1000).

-spec buildMultiples(list(), list(), integer()) -> list().
buildMultiples([H|T], Multiples, Maximum) when H < Maximum ->
	buildMultiples([nextMultiple(H+1,Multiples)|[H|T]],Multiples,Maximum);
buildMultiples([_|T], _, _) ->
	T.

-spec nextMultiple(integer(), list()) -> integer().
nextMultiple(Candidate,Multiples) ->
	nextMultiple(Candidate,Multiples,isMultiple(Candidate,Multiples)).

-spec nextMultiple(integer(), list(), boolean()) -> integer().
nextMultiple(Candidate,_,true) ->
	Candidate;
nextMultiple(Candidate,Multiples,_) ->
	nextMultiple(Candidate+1, Multiples).

-spec isMultiple(integer(), list()) -> boolean().
isMultiple(_, []) ->
        false;
isMultiple(Candidate, [H|_]) when Candidate rem H == 0 ->
	true;
isMultiple(Candidate, [_|T]) ->
	isMultiple(Candidate,T).

-spec sum(list()) -> integer().
sum(List) ->
	sum(0, List).

-spec sum(integer(), list()) -> integer().
sum(Acc,[]) ->
	Acc;
sum(Acc,[H|T]) ->
	sum(Acc + H, T).
