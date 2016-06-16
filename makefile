#actual config files everything depends on
DOTS=ag/ignore bash/init comp/stconf.h comp/surfconf.h fish/config fish/fishd fish/functions git/config gpg/agentconf gpg/conf kb/neo.xmodmap mail/config msmtp/config offlineimap/config profile/profile sxhkd/sxhkdrc userdirs/dirs x/init comp/stconf.h comp/surfconf.h

INSTALLED=/home/adrian/.agignore /home/adrian/.bashrc /home/adrian/.config/fish/config.fish /home/adrian/.config/fish/fishd.elektronengehirn /home/adrian/.config/fish/functions.fish /home/adrian/.gitconfig /home/adrian/.gnupg/gpg-agent.conf /home/adrian/.gnupg/gpg.conf /home/adrian/.mailrc /home/adrian/.msmtprc /home/adrian/.offlineimaprc /home/adrian/.profile /home/adrian/.config/sxhkd/sxhkdrc /usr/local/src/st/config.def.h /usr/local/src/surf/config.def.h

DOTDIR = $(shell pwd)

all: $(DOTS) $(INSTALLED)

clean:
	rm -f $(INSTALLED)

/home/adrian/.agignore: $(DOTDIR)/ag/ignore
	ln $< $@
/home/adrian/.bashrc: $(DOTDIR)/bash/init
	ln $< $@
/home/adrian/.config/fish/config.fish: $(DOTDIR)/fish/config
	ln $< $@
/home/adrian/.config/fish/fishd.elektronengehirn: $(DOTDIR)/fish/fishd
	ln $< $@
/home/adrian/.config/fish/functions.fish: $(DOTDIR)/fish/functions
	ln $< $@
/home/adrian/.gitconfig: $(DOTDIR)/git/config
	ln $< $@
/home/adrian/.gnupg/gpg-agent.conf: $(DOTDIR)/gpg/agentconf
	ln $< $@
/home/adrian/.gnupg/gpg.conf: $(DOTDIR)/gpg/conf
	ln $< $@
/home/adrian/.mailrc: $(DOTDIR)/mail/config
	ln $< $@
/home/adrian/.msmtprc: $(DOTDIR)/msmtp/config
	ln $< $@
/home/adrian/.offlineimaprc: $(DOTDIR)/offlineimap/config
	ln $< $@
/home/adrian/.profile: $(DOTDIR)/profile/profile
	ln $< $@
/home/adrian/.config/sxhkd/sxhkdrc: $(DOTDIR)/sxhkd/sxhkdrc
	ln $< $@
/home/adrian/.config/user-dirs.dirs: $(DOTDIR)/userdirs/dirs
	ln $< $@
/home/adrian/.xinitrc: $(DOTDIR)/x/init
	ln $< $@

#compiled configuration

/usr/local/src/st/config.def.h: $(DOTDIR)/comp/stconf.h
	ln $< $@
/usr/local/src/surf/config.def.h: $(DOTDIR)/comp/surfconf.h
	ln $< $@
