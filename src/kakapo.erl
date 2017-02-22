-module(kakapo).
-export([start_link/0]).

start_link() ->
    Pid = spawn_link(fun loop/0),
    true = register(?MODULE, Pid),
    {ok, Pid}.

loop() ->
    receive
        log ->
            error_logger:info_msg("Log something...", []),
            loop();
        Any ->
            loop()
    end.