if status --is-interactive

umask 066

set -x -g LANG de_DE.UTF-8
set -x -g PATH_SEPARATOR :

set -x -g PATH /usr/bin /usr/local/bin /home/adrian/bin /usr/local/bin /usr/local/plan9/bin
set -x -g PLAN9 /usr/local/plan9

set -x -g BUG_PROJECT /home/adrian/proj/begun/mset/.bugdb
set -x -g EDITOR e
set -x -g VISUAL sam

function fortune
	command fortune /usr/local/plan9/lib/fortunes
end

function troll
	fortune /usr/local/share/troll
end

function cl
	command ls --color=always --group-directories-first $argv
end

function ll
	command ls -ali --color=always --group-directories-first $argv
end

function l
	command ls --color=never $argv
end

function ls
	command ls -ali --color=never --group-directories-first $argv
end

function g
	grep -E $argv
end

function rr
	rm -r $argv
end

function e
	command ed $argv
end

function cs
	clear
end

function lc
	wc -l $argv
end

function ee
	chmod 0700 * $argv
end

function en
	chmod 0600 * $argv
end

function fe
	chmod 0711 * $argv
end

function md
	mkdir $argv
end

function d
	pwd $argv
end

function rd
	rmdir $argv
end

function cd..
	cd ..
end

function tch
	touch $argv
end

function python
	python2.7 $argv
end

function pacman
	command pacman --color always $argv
end

function bullshit
	command bullshit /usr/local/share/bullshit
end

function rm
	r $argv
end

#rlwrap is great

function mira
	rlwrap -s 1000000 mira $argv
end

function rc
	rlwrap -s 1000000 rc $argv
end

function ed
	rlwrap -s 1000000 ed $argv
end

function tl
	rlwrap -s 1000000 tl $argv
end

function pn
	rlwrap -s 1000000 pn $argv
end

function shirka
	rlwrap -s 1000000 shirka $argv
end

#Just to troll a little bit
function emacs
	ed -r -s
end

function vim
	info Ed
end

function vi
	man ed
end

function nano
	sam
end

function fish_greeting
	true
end

function fish_prompt
	set_color 444444

	echo -n (pwd)

	set_color normal
	
	echo -n ' » '
end

function fish_right_prompt
	set_color 111111
	echo "2o "(gawk 'BEGIN { print systime() }')"p q" | dc
	set_color normal
end

bu&

end
