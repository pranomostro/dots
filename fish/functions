#function definition for the fish shell

#fortune and fortune-likes, entertaining!

function fortune
	command fortune /usr/local/plan9/lib/fortunes
end

function troll
	command fortune /usr/local/share/troll
end

function bullshit
	command bullshit /usr/local/share/bullshit
end

#having default options to commands which are always useful.

function pacman
	command pacman --color always $argv
end

function cl
	command ls --color=always --group-directories-first $argv
end

function ll
	command ls -ali --color=never --group-directories-first $argv
end

function l
	command ls --color=never $argv
end

function ls
	command ls --color=never $argv
end

function e
	command ed $argv
end

function nl
	command nl -ba $argv
end

function man
	command man $argv | less
end

function bc
	command bc -q $argv
end

#definition of new commands or just abbreviations

function g
	grep -E $argv
end

function rr
	rm -r $argv
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

function rm
	r $argv
end

#rlwrap is great

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
	rlwrap -s 1000000 (which potion) $argv
end

function potion
	rlwrap -s 1000000 (which potion) $argv
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
	sam $argv
end

