-module(kakapo_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

-include("kakapo.hrl").

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    kakapo_sup:start_link().

stop(_State) ->
    ok.
