-module(erun).
-export([rand_node/0, start/0, mess_up/1, fire_off/0]).

rand_node() ->
    Nodes = nodes(),
    Index = random:uniform(length(Nodes)),
    lists:nth(Index, Nodes).

start() ->
    receive
        {Msg} ->
            io:fwrite("~s~n", [Msg]),
            timer:sleep(1000),
            {shell, rand_node()} ! {mess_up(Msg)},
            start()
    end.

mess_up(Str) ->
    Index = random:uniform(length(Str) - 1),
    Start = string:substr(Str, 1, Index),
    Start ++ "a" ++ string:substr(Str, Index + 2).

fire_off() ->
    {shell, rand_node()} ! "banana",
    start().
