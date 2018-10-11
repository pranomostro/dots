include config.mk

install: $(DOTS) $(INSTALLED)

uninstall:
	rm -f $(INSTALLED)

$(HOME)/.agignore: $(DOTDIR)/ag/ignore
	ln $? $@
$(HOME)/.bashrc: $(DOTDIR)/bash/init
	ln $? $@
$(HOME)/.bash_profile: $(DOTDIR)/bash/profile
	ln $? $@
$(HOME)/.config/fish/config.fish: $(DOTDIR)/fish/config
	ln $? $@
$(HOME)/.config/fish/fishd.elektronengehirn: $(DOTDIR)/fish/fishd
	ln $? $@
$(HOME)/.config/fish/functions.fish: $(DOTDIR)/fish/functions
	ln $? $@
$(HOME)/.gdbinit: $(DOTDIR)/gdb/init
	ln $? $@
$(HOME)/.gitconfig: $(DOTDIR)/git/config
	ln $? $@
$(HOME)/.gnupg/gpg-agent.conf: $(DOTDIR)/gpg/agentconf
	ln $? $@
$(HOME)/.gnupg/gpg.conf: $(DOTDIR)/gpg/conf
	ln $? $@
$(HOME)/.mailrc: $(DOTDIR)/mail/config
	ln $? $@
$(HOME)/.mblaze/filter: $(DOTDIR)/mblaze/filter
	ln $? $@
$(HOME)/.mblaze/profile: $(DOTDIR)/mblaze/profile
	ln $? $@
$(HOME)/.mbsyncrc: $(DOTDIR)/mbsync/config
	ln $? $@
$(HOME)/.msmtprc: $(DOTDIR)/msmtp/config
	ln $? $@
$(HOME)/.config/user-dirs.dirs: $(DOTDIR)/userdirs/dirs
	ln $? $@
$(HOME)/.xinitrc: $(DOTDIR)/x/init
	ln $? $@
$(HOME)/.xmodmap: $(DOTDIR)/kb/neo.xmodmap
	ln $? $@

#compiled configuration

$(SRCDIR)/dwm/config.h: $(DOTDIR)/comp/dwmconf.h
	ln $? $@
$(SRCDIR)/slstatus/config.h: $(DOTDIR)/comp/slstatusconf.h
	ln $? $@
$(SRCDIR)/st/config.h: $(DOTDIR)/comp/stconf.h
	ln $? $@
$(SRCDIR)/slock/config.h: $(DOTDIR)/comp/slockconf.h
	ln $? $@

.PHONY: install uninstall
