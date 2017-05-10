#actual config files everything depends on
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
	/usr/local/src/dwm/config.h \
	/usr/local/src/slstatus/config.h \
	/usr/local/src/st/config.h \
	/usr/local/src/slock/config.h

DOTDIR=$(shell pwd)
HOME=$(shell echo $$HOME)
