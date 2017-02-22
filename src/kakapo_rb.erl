-module(kakapo_rb).
-export([start/0]).

start() ->
    {ok,P} = rb:start([{report_dir, "log/"}]),
    rb:show().
