-module(kakapo_app).

-behaviour(application).

%% Application callbacks
-export([start/0, start/2,
         stop/1
]).

-include("kakapo.hrl").

%% ===================================================================
%% Application callbacks
%% ===================================================================

start() ->
    application:start(kakapo).

start(_StartType, _StartArgs) ->
    Handlers = application:get_env(kakapo, event_handler, [kakapo_h]),
    LogDir = application:get_env(kakapo, log_dir, "log/"),
    LogFileSize = application:get_env(kakapo, log_file_size, 1 * 1024 * 1024),
    LogFileMax = application:get_env(kakapo, log_file_max, 10),
    ok = start_error_logger_handlers(Handlers, LogDir, LogFileSize, LogFileMax),
    kakapo_sup:start_link().

stop(_State) ->
    ok.

start_error_logger_handlers([], LogDir, LogFileSize, LogFileMax) ->
    ok;
start_error_logger_handlers([H|T], LogDir, LogFileSize, LogFileMax) ->
    case H of
        log_mf_h ->
            % 5 Mb each, 100 total files
            Args = log_mf_h:init(LogDir, LogFileSize, LogFileMax),
            ok = error_logger:add_report_handler(log_mf_h, Args),
            start_error_logger_handlers(T, LogDir, LogFileSize, LogFileMax);
        kakapo_h ->
            ok = error_logger:add_report_handler(kakapo_h,[LogDir, LogFileSize, LogFileMax]),
            start_error_logger_handlers(T, LogDir, LogFileSize, LogFileMax);
        H ->
            ok = error_logger:add_report_handler(H, [LogDir, LogFileSize, LogFileMax]),
            start_error_logger_handlers(T, LogDir, LogFileSize, LogFileMax) 
    end.