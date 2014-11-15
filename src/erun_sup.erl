-module(erun_sup).
-behavior(supervisor).
-export([start_link/0, init/1]).

start_link() ->
    supervisor:start_link({global, ?MODULE, []}).

init([]) ->
    {ok, {{one_for_one, 1, 10},
          [{erun,
            {erun_server, start_link, []},
            permanent,
            5000,
            worker,
            [erun_server]
           }]}}.
