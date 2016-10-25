#actual config files everything depends on
DOTS=ag/ignore \
bash/init \
comp/stconf.h \
comp/surfconf.h \
fish/config \
fish/fishd \
fish/functions \
gdb/init \
git/config \
gpg/agentconf \
gpg/conf \
kb/neo.xmodmap \
mail/config \
mbsync/config \
msmtp/config \
profile/profile \
sxhkd/sxhkdrc \
userdirs/dirs \
x/init \
comp/slockconf.h \
comp/slstatusconf.h \
comp/stconf.h \
comp/surfconf.h

INSTALLED=$(HOME)/.agignore \
$(HOME)/.bashrc \
$(HOME)/.config/fish/config.fish \
$(HOME)/.config/fish/fishd.elektronengehirn \
$(HOME)/.config/fish/functions.fish \
$(HOME)/.gdbinit \
$(HOME)/.gitconfig \
$(HOME)/.gnupg/gpg-agent.conf \
$(HOME)/.gnupg/gpg.conf \
$(HOME)/.mailrc \
$(HOME)/.mbsyncrc \
$(HOME)/.msmtprc \
$(HOME)/.profile \
$(HOME)/.config/sxhkd/sxhkdrc \
$(HOME)/.xinitrc \
/usr/local/src/slstatus/config.def.h \
/usr/local/src/st/config.def.h \
/usr/local/src/surf/config.def.h \
/usr/local/src/slock/config.def.h

DOTDIR = $(shell pwd)
HOME = $(shell echo $$HOME)

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

#compiled configuration

/usr/local/src/slstatus/config.def.h: $(DOTDIR)/comp/slstatusconf.h
	ln $< $@
/usr/local/src/st/config.def.h: $(DOTDIR)/comp/stconf.h
	ln $< $@
/usr/local/src/surf/config.def.h: $(DOTDIR)/comp/surfconf.h
	ln $< $@
/usr/local/src/slock/config.def.h: $(DOTDIR)/comp/slockconf.h
	ln $< $@

.PHONY: all clean
