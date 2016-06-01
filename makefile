#links to the home directory
HOME=/home/adrian/.agignore /home/adrian/.bashrc /home/adrian/.procmailrc /home/adrian/.gitconfig /home/adrian/.profile /home/adrian/.mailrc /home/adrian/.msmtprc /home/adrian/.mirarc /home/adrian/.toprc /home/adrian/.xinitrc /home/adrian/.gnupg/gpg-agent.conf /home/adrian/.gnupg/gpg.conf

#links to header files for configuration
HEADERS=/usr/local/src/st/config.def.h

#links to .config
TOCONF=/home/adrian/.config/sxhkd/sxhkdrc /home/adrian/.config/fish/config.fish /home/adrian/.config/fish/functions.fish /home/adrian/.config/fish/fishd.elektronengehirn /home/adrian/.config/user-dirs.dirs /home/adrian/.config/git/ignore

DOTS = $(shell pwd)

all: $(HOME) $(HEADERS) $(TOCONF)

clean:
	rm -f $(HOME) $(HEADERS) $(TOCONF)

/home/adrian/.agignore: $(DOTS)/ag/ignore
	ln $< $@
/home/adrian/.bashrc: $(DOTS)/bash/init
	ln $< $@
/home/adrian/.procmailrc: $(DOTS)/procmail/config
	ln $< $@
/home/adrian/.gitconfig: $(DOTS)/git/config
	ln $< $@
/home/adrian/.profile: $(DOTS)/profile/profile
	ln $< $@
/home/adrian/.mailrc: $(DOTS)/mail/config
	ln $< $@
/home/adrian/.msmtprc: $(DOTS)/msmtp/config
	ln $< $@
/home/adrian/.mirarc: $(DOTS)/mira/init
	ln $< $@
/home/adrian/.toprc: $(DOTS)/top/init
	ln $< $@
/home/adrian/.xinitrc: $(DOTS)/x/init
	ln $< $@
/home/adrian/.gnupg/gpg-agent.conf: $(DOTS)/gpg/agentconf
	ln $< $@
/home/adrian/.gnupg/gpg.conf: $(DOTS)/gpg/conf
	ln $< $@
/usr/local/src/st/config.def.h: $(DOTS)/comp/stconf.h
	ln $< $@
/home/adrian/.config/sxhkd/sxhkdrc: $(DOTS)/sxhkd/sxhkdrc
	ln $< $@
/home/adrian/.config/fish/config.fish: $(DOTS)/fish/config
	ln $< $@
/home/adrian/.config/fish/functions.fish: $(DOTS)/fish/functions
	ln $< $@
/home/adrian/.config/fish/fishd.elektronengehirn: $(DOTS)/fish/fishd
	ln $< $@
/home/adrian/.config/user-dirs.dirs: $(DOTS)/userdirs/dirs
	ln $< $@
/home/adrian/.config/git/ignore: $(DOTS)/git/ignore
	ln $< $@
