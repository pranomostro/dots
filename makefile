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
$(HOME)/.config/fish/config.fish: $(DOTDIR)/fish/conf
	ln $? $@
$(HOME)/.config/fish/functions.fish: $(DOTDIR)/fish/functions
	ln $? $@
$(HOME)/.config/fish/fish_variables: $(DOTDIR)/fish/variables
	ln $? $@
$(HOME)/.gdbinit: $(DOTDIR)/gdb/init
	ln $? $@
$(HOME)/.gitconfig: $(DOTDIR)/git/conf
	ln $? $@
$(HOME)/.gitignore: $(DOTDIR)/git/ignore
	ln $? $@
$(HOME)/.gnupg/gpg-agent.conf: $(DOTDIR)/gpg/agentconf
	ln $? $@
$(HOME)/.gnupg/gpg.conf: $(DOTDIR)/gpg/conf
	ln $? $@
$(HOME)/.inputrc: $(DOTDIR)/input/conf
	ln $? $@
$(HOME)/.mailrc: $(DOTDIR)/mail/conf
	ln $? $@
$(HOME)/.mblaze/filter: $(DOTDIR)/mblaze/filter
	ln $? $@
$(HOME)/.mblaze/profile: $(DOTDIR)/mblaze/profile
	ln $? $@
$(HOME)/.mbsyncrc: $(DOTDIR)/mbsync/conf
	ln $? $@
$(HOME)/.msmtprc: $(DOTDIR)/msmtp/conf
	ln $? $@
$(HOME)/.config/user-dirs.dirs: $(DOTDIR)/userdirs/dirs
	ln $? $@
$(HOME)/.when/preferences: $(DOTDIR)/when/conf
	ln $? $@
$(HOME)/.xinitrc: $(DOTDIR)/x/init
	ln $? $@
$(HOME)/.xmodmap: $(DOTDIR)/x/neo
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
