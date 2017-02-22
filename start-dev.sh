#!/bin/sh

# -mnesia dir "'"$PWD"/Mnesia'"

cd `dirname $0`
exec erl -sname kakapo -config $PWD/sys.config -pa $PWD/ebin $PWD/deps/*/ebin $PWD/test -boot start_sasl -setcookie kakapo -s kakapo_app start