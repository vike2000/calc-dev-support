#!/usr/bin/env bash

if [[ $(which vpath) ]];then
	source "$(vpath vbash base)" # vike's path to vbash base
else
	_vit(){ read -sp	"$*…"	;env "$@";} # underscore is half legacy, half trad. private; verbose interrupt test
	_vnq(){ echo		"$*"	;env "$@";} # underscore is half legacy, half trad. private; verbose not quiet
	fi

#cspell:ignore readline dyld CALCCUSTOMHELP

(($#))||set -- "$(dirname "$0")"/pfe.cal

if((make		));then
	(_vit ~/Library/Python/3.8/bin/compile\db	make clobber all READLINE_INCLUDE=' -I/opt/local/include/readline' READLINE_LIB=' -L/opt/local/lib -l''readline');fi
if((install		));then
	installed=1
	(_vit										make	 install READLINE_INCLUDE=' -I/opt/local/include/readline' READLINE_LIB=' -L/opt/local/lib -l''readline');fi
if((installed	));then
	(_vnq CALCCUSTOMHELP=/usr/local/share/calc/						/usr/local/bin/calc -Cp "read $1;" "${@:2}")
else(_vnq CALCCUSTOMHELP=./						DYLD_LIBRARY_PATH=.				 ./calc -Cp "read $1;" "${@:2}");fi

# uses personal root /∂/
# $                                                   (export make=0 install=0 installed=install+0 && dev=0 && unset test&&test='base' && { ((dev))&&f=-dev||{ ((dev>1))&&f=-v||f=+conf;};}&&cd1 /∂/git/calc custom/pfe-v.sh custom/pfe$f.cal "$(((dev))||([[ ${test+?} ]]&&echo ";pfe${test:+_$test}_test()"))$(((dev>1))||  echo ';custom("help","pfe")')")
# $ (for test in base cal '';do echo >&2 test:$test && export make=0 install=0 installed=install+0 && dev=0 &&                            { ((dev))&&f=-dev||{ ((dev>1))&&f=-v||f=+conf;};}&&cd1 /∂/git/calc custom/pfe-v.sh custom/pfe$f.cal "$(((dev))||([[ ${test+?} ]]&&echo ";pfe${test:+_$test}_test()"))$(((dev>1))||: echo ';custom("help","pfe")')";done)
# $ (clang-format()(clang-format-mp-18 "$@") && REWRITE_SRC_IN_PLACE=1 && src=custom/u_pfe.c && styleExtra='IndentWidth: 4, ContinuationIndentWidth: 4' &&: " NOTE: Uses externals: vdiff, & error " :&& clang-format-style()(printf %s -style="$([[ $1 =~ file(:.*)? ]]&&echo "$1"||echo "{BasedOnStyle: $1, $styleExtra}")") && clang-format-print()(clang-format "$(clang-format-style "$1")" "${@:2}" "$src") && clang-format-diff()(vdiff "$src" <(clang-format-print "$@" $(((!REWRITE_SRC_IN_PLACE))||printf %s -i))) && main()(clang-format-diff "$@"|less ; clang-format-print "$@"|SOURCE_HIGHLIGHT_LESSPIPE_LANG_DEF=c less) && dumpConfig()(clang-format "$(clang-format-style "$1")" -dump-config) && pageConfig()(dumpConfig "$1"|less) && writeConfig()(f=.clang-format && ! test -a "$f" && clang-format "$(clang-format-style "$1")" -dump-config |tee "$f" || return $(error 1 "won't clobber $f w/ style $1")) && stls=( LLVM, GNU, Google, Chromium, Microsoft, Mozilla, WebKit $(: ' list comes from `clang-format -h|awk "s{print;exit}/--style/{s=1}"` ' :) ) && reselect()(select stl in "${stls[@]}";do main "$stl" "$@";done) && preselect()(preselect=$1 && declare -A stlAssoc && for _s in "${!stls[@]}";do stlAssoc[${stls[_s]%,}]=$_s;done && reselect< <(echo ${stlAssoc[$preselect]} && echo preselecting >&2 "${stlAssoc[$preselect]}) $preselect; disable by running main, *Config, or reselect instead of preselect")) && main file)
# uses personal patched clang-format and personal function vdiff
# $ (cd /∂/git/calc/custom && vdiff pfe.cal <(/∂/git/llvm-project/build/bin/clang-format -style=file pfe.cal)|less) # cd1 /∂/git/calc /∂/git/llvm-project/build/bin/clang-format -style=file clang-format-testee.c
# uses personal function cd1
# $ cd1 /∂/git/calc/custom /∂/git/llvm-project/build/bin/clang-format -style=file -i pfe.cal