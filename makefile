#links to the home directory
HOME=/home/adrian/.agignore /home/adrian/.bashrc /home/adrian/.gitconfig /home/adrian/.profile /home/adrian/.msmtprc /home/adrian/.mirarc /home/adrian/.toprc /home/adrian/.xinitrc /home/adrian/.gnupg/gpg-agent.conf /home/adrian/.gnupg/gpg.conf

#links to header files for configuration
HEADERS=/home/adrian/proj/begun/dmc/config.def.h /usr/local/src/st/config.def.h

#links to .config
TOCONF=/home/adrian/.config/sxhkd/sxhkdrc /home/adrian/.config/fish/config.fish /home/adrian/.config/fish/functions.fish /home/adrian/.config/fish/fishd.elektronengehirn /home/adrian/.config/user-dirs.dirs /home/adrian/.config/git/ignore

DOTS = $(shell pwd)

all: $(HOME) $(HEADERS) $(TOCONF)

clean:
	rm -f $(HOME) $(HEADERS) $(TOCONF)

/home/adrian/.agignore: $(DOTS)/ag/ignore
	ln -s $< $@
/home/adrian/.bashrc: $(DOTS)/bash/init
	ln -s $< $@
/home/adrian/.gitconfig: $(DOTS)/git/config
	ln -s $< $@
/home/adrian/.profile: $(DOTS)/profile/profile
	ln -s $< $@
/home/adrian/.msmtprc: $(DOTS)/msmtp/config
	ln -s $< $@
/home/adrian/.mirarc: $(DOTS)/mira/init
	ln -s $< $@
/home/adrian/.toprc: $(DOTS)/top/init
	ln -s $< $@
/home/adrian/.xinitrc: $(DOTS)/x/init
	ln -s $< $@
/home/adrian/.gnupg/gpg-agent.conf: $(DOTS)/gpg/agentconf
	ln -s $< $@
/home/adrian/.gnupg/gpg.conf: $(DOTS)/gpg/conf
	ln -s $< $@
/home/adrian/proj/begun/dmc/config.def.h: $(DOTS)/comp/dmcconf.h
	ln -s $< $@
/usr/local/src/st/config.def.h: $(DOTS)/comp/stconf.h
	ln -s $< $@
/usr/local/src/vis/config.def.h: $(DOTS)/comp/visconf.h
	ln -s $< $@
/home/adrian/.config/sxhkd/sxhkdrc: $(DOTS)/sxhkd/sxhkdrc
	ln -s $< $@
/home/adrian/.config/fish/config.fish: $(DOTS)/fish/config
	ln -s $< $@
/home/adrian/.config/fish/functions.fish: $(DOTS)/fish/functions
	ln -s $< $@
/home/adrian/.config/fish/fishd.elektronengehirn: $(DOTS)/fish/fishd
	ln -s $< $@
/home/adrian/.config/user-dirs.dirs: $(DOTS)/userdirs/dirs
	ln -s $< $@
/home/adrian/.config/git/ignore: $(DOTS)/git/ignore
	ln -s $< $@
