#actual config files everything depends on

HOME=/home/pranomostro
DOTDIR=$(HOME)/proj/misc/dots
SRCDIR=/usr/local/src

DOTS= \
	ag/ignore \
	bash/init \
	bash/profile \
	fish/conf \
	fish/functions \
	fish/variables \
	gdb/init \
	git/conf \
	gpg/agentconf \
	gpg/conf \
	input/conf \
	mail/conf \
	mblaze/filter \
	mblaze/profile \
	mbsync/conf \
	msmtp/conf \
	userdirs/dirs \
	when/conf \
	x/init \
	x/neo \
	comp/dwmconf.h \
	comp/slockconf.h \
	comp/slstatusconf.h \
	comp/stconf.h \

INSTALLED= \
	$(HOME)/.agignore \
	$(HOME)/.bashrc \
	$(HOME)/.bash_profile \
	$(HOME)/.config/fish/config.fish \
	$(HOME)/.config/fish/functions.fish \
	$(HOME)/.config/fish/fish_variables \
	$(HOME)/.gdbinit \
	$(HOME)/.gitconfig \
	$(HOME)/.gnupg/gpg-agent.conf \
	$(HOME)/.gnupg/gpg.conf \
	$(HOME)/.inputrc \
	$(HOME)/.mailrc \
	$(HOME)/.mblaze/filter \
	$(HOME)/.mblaze/profile \
	$(HOME)/.mbsyncrc \
	$(HOME)/.msmtprc \
	$(HOME)/.when/preferences \
	$(HOME)/.xinitrc \
	$(HOME)/.xmodmap \
	$(SRCDIR)/dwm/config.h \
	$(SRCDIR)/slstatus/config.h \
	$(SRCDIR)/st/config.h \
	$(SRCDIR)/slock/config.h

