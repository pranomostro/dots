#actual config files everything depends on

HOME=/home/adrian
DOTDIR=$(HOME)/proj/begun/dots
SRCDIR=/usr/local/src

DOTS= \
	ag/ignore \
	bash/init \
	comp/stconf.h \
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
	comp/dwmconf.h \
	comp/slockconf.h \
	comp/slstatusconf.h \
	comp/stconf.h \

INSTALLED= \
	$(HOME)/.agignore \
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
	$(HOME)/.xmodmap \
	$(SRCDIR)/dwm/config.h \
	$(SRCDIR)/slstatus/config.h \
	$(SRCDIR)/st/config.h \
	$(SRCDIR)/slock/config.h

