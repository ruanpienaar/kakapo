-module(kakapo_h).
-behaviour(gen_event).
-export([init/1, handle_event/2, handle_call/2, handle_info/2, terminate/2, code_change/3]).

init([LogDir, LogFileSize, LogFileMax]) ->
    io:format("init:", []),
    {ok, undefined}.

%% Generated when error_msg/1,2 or format is called.
handle_event(E={error, Gleader, {Pid, Format, Data}}, State) ->
    io:format("Event was:~p~n", [E]),
    {ok, State};
%% Generated when error_report/1 is called.
handle_event(E={error_report, Gleader, {Pid, std_error, Report}}, State) ->
    io:format("Event was:~p~n", [E]),
    {ok, State};
%% Generated when error_report/2 is called.
handle_event(E={error_report, Gleader, {Pid, Type, Report}}, State) ->
    io:format("Event was:~p~n", [E]),
    {ok, State};
%% Generated when warning_msg/1,2 is called if warnings are set to be tagged as warnings.
handle_event(E={warning_msg, Gleader, {Pid, Format, Data}}, State) ->
    io:format("Event was:~p~n", [E]),
    {ok, State};
%% Generated when warning_report/1 is called if warnings are set to be tagged as warnings.
handle_event(E={warning_report, Gleader, {Pid, std_warning, Report}}, State) ->
    io:format("Event was:~p~n", [E]),
    {ok, State};
%% Generated when warning_report/2 is called if warnings are set to be tagged as warnings.
handle_event(E={warning_report, Gleader, {Pid, Type, Report}}, State) ->
    io:format("Event was:~p~n", [E]),
    {ok, State};
%% Generated when info_msg/1,2 is called.
handle_event(E={info_msg, Gleader, {Pid, Format, Data}}, State) ->
    io:format("Event was:~p~n", [E]),
    {ok, State};
%% Generated when info_report/1 is called.
handle_event(E={info_report, Gleader, {Pid, std_info, Report}}, State) ->
    io:format("Event was:~p~n", [E]),
    {ok, State};
%% Generated when info_report/2 is called.
handle_event(E={info_report, Gleader, {Pid, Type, Report}}, State) ->
    io:format("Event was:~p~n", [E]),
    {ok, State};
handle_event(Event, State) ->
    io:format("handle_event:~p~n", [Event]),
    {ok, State}.

handle_call(Request, _State) ->
    io:format("handle_call:~p~n", [Request]),
    {remove_handler, {error, unknown_call}}.

handle_info(Info, State) ->
    io:format("handle_info:~p~n", [Info]),
    {ok, State}.

terminate(Reason, _State) ->
    io:format("terminate:~p~n", [Reason]),
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.