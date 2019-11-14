ROOT = $(shell pwd)

.PHONY: install
install:
	@git config --global commit.template $(ROOT)/git/git-message.txt
	@git config --global --add core.excludesfile $(ROOT)/git/.gitignore
	@sh ./git/git-alias-setting.sh
