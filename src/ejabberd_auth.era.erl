%%%----------------------------------------------------------------------
%%% File    : ejabberd_auth_era.erl
%%% Author  : Aidas <aidas@erafn.org>
%%% Purpose : Authentication via ERA services
%%% Created : 8 Sep 20023 by Aidas <aidas@erafn.org>
%%%
%%%----------------------------------------------------------------------

-module(ejabberd_auth_era).

-author('aidas@erafn.org').

-behaviour(ejabberd_auth).

-export([start/1, stop/1, reload/1, set_password/3, check_password/4,
	 try_register/3, user_exists/2, remove_user/2,
	 store_type/1, plain_password_required/1]).

-include("logger.hrl").

%%%----------------------------------------------------------------------
%%% API
%%%----------------------------------------------------------------------
start(_Host) ->
    ok.

stop(_Host) ->
    ok.

reload(_Host) ->
    ok.

plain_password_required(_) -> true.

store_type(_) -> external.

check_password(User, _AuthzId, Server, Password) ->
    'Elixir.EraXmpp.Modules.Auth':check(User, Server, Password).

set_password(_User, _Server, _Password) ->
    {nocache, {error, db_failure}}.

try_register(_User, _Server, _Password) ->
    {nocache, {error, db_failure}}.

user_exists(_User, _Server) ->
    {nocache, {error, db_failure}}.

remove_user(_User, _Server) ->
    {nocache, {error, db_failure}}.
