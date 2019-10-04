ROOT = $(shell pwd)

.PHONY: install
install:
	@git config --global --add core.excludesfile $(ROOT)/git/.gitignore
	@sh ./git/git-alias-setting/git-alias-setting.sh
