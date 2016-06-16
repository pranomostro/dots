#actual config files everything depends on
DOTS=ag/ignore bash/init comp/stconf.h comp/surfconf.h fish/config fish/fishd fish/functions git/config gpg/agentconf gpg/conf kb/neo.xmodmap mail/config msmtp/config offlineimap/config profile/profile sxhkd/sxhkdrc userdirs/dirs x/init

DOTDIR = $(shell pwd)

all: $(DOTS)

clean:
	rm -f $(HOME) $(HEADERS) $(TOCONF)

$(DOTDIR)/ag/ignore : /home/adrian/.agignore
	ln $@ $<
$(DOTDIR)/bash/init : /home/adrian/.bashrc
	ln $@ $<
$(DOTDIR)/fish/config : /home/adrian/.config/fish/config.fish
	ln $@ $<
$(DOTDIR)/fish/fishd : /home/adrian/.config/fish/fishd.elektronengehirn
	ln $@ $<
$(DOTDIR)/fish/functions : /home/adrian/.config/fish/functions.fish
	ln $@ $<
$(DOTDIR)/git/config : /home/adrian/.gitconfig
	ln $@ $<
$(DOTDIR)/gpg/agentconf : /home/adrian/.gnupg/gpg-agent.conf
	ln $@ $<
$(DOTDIR)/gpg/conf : /home/adrian/.gnupg/gpg.conf
	ln $@ $<
$(DOTDIR)/mail/config : /home/adrian/.mailrc
	ln $@ $<
$(DOTDIR)/msmtp/config : /home/adrian/.msmtprc
	ln $@ $<
$(DOTDIR)/offlineimap/config : /home/adrian/.offlineimaprc
	ln $@ $<
$(DOTDIR)/profile/profile : /home/adrian/.profile
	ln $@ $<
$(DOTDIR)/sxhkd/sxhkdrc : /home/adrian/.config/sxhkd/sxhkdrc

$(DOTDIR)/userdirs/dirs : /home/adrian/.config/user-dirs.dirs
	ln $@ $<

#compiled configuration
/home/adrian/.xinitrc: $(DOTDIR)/x/init
	ln $< $@
/usr/local/src/st/config.def.h: $(DOTDIR)/comp/stconf.h
	ln $< $@
/usr/local/src/surf/config.def.h: $(DOTDIR)/comp/surfconf.h
	ln $< $@
