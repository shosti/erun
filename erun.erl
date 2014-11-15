-module(erun).
-export([rand_node/0]).

rand_node() ->
    Nodes = nodes(),
    Index = random:uniform(length(Nodes)),
    lists:nth(Index, Nodes).

start() ->
    receive
        {Msg} ->
            io:fwrite("~s~n", [Msg]),
            start().
