include config.mk

all: $(DOTS) $(INSTALLED)

clean:
	rm -f $(INSTALLED)

$(HOME)/.agignore: $(DOTDIR)/ag/ignore
	ln $< $@
$(HOME)/.bashrc: $(DOTDIR)/bash/init
	ln $< $@
$(HOME)/.config/fish/config.fish: $(DOTDIR)/fish/config
	ln $< $@
$(HOME)/.config/fish/fishd.elektronengehirn: $(DOTDIR)/fish/fishd
	ln $< $@
$(HOME)/.config/fish/functions.fish: $(DOTDIR)/fish/functions
	ln $< $@
$(HOME)/.gdbinit: $(DOTDIR)/gdb/init
	ln $< $@
$(HOME)/.gitconfig: $(DOTDIR)/git/config
	ln $< $@
$(HOME)/.gnupg/gpg-agent.conf: $(DOTDIR)/gpg/agentconf
	ln $< $@
$(HOME)/.gnupg/gpg.conf: $(DOTDIR)/gpg/conf
	ln $< $@
$(HOME)/.mailrc: $(DOTDIR)/mail/config
	ln $< $@
$(HOME)/.mbsyncrc: $(DOTDIR)/mbsync/config
	ln $< $@
$(HOME)/.msmtprc: $(DOTDIR)/msmtp/config
	ln $< $@
$(HOME)/.profile: $(DOTDIR)/profile/profile
	ln $< $@
$(HOME)/.config/sxhkd/sxhkdrc: $(DOTDIR)/sxhkd/sxhkdrc
	ln $< $@
$(HOME)/.config/user-dirs.dirs: $(DOTDIR)/userdirs/dirs
	ln $< $@
$(HOME)/.xinitrc: $(DOTDIR)/x/init
	ln $< $@
$(HOME)/.xmodmap: $(DOTDIR)/kb/neo.xmodmap
	ln $< $@

#compiled configuration

/usr/local/src/dwm/config.h: $(DOTDIR)/comp/dwmconf.h
	ln $< $@
/usr/local/src/slstatus/config.h: $(DOTDIR)/comp/slstatusconf.h
	ln $< $@
/usr/local/src/st/config.h: $(DOTDIR)/comp/stconf.h
	ln $< $@
/usr/local/src/slock/config.h: $(DOTDIR)/comp/slockconf.h
	ln $< $@

.PHONY: all clean
