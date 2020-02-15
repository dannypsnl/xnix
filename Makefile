ROOT = $(shell pwd)

.PHONY: install
install:
	@git config --global commit.template $(ROOT)/git/git-message.txt
	@git config --global --add core.excludesfile $(ROOT)/git/.gitignore
	@sh $(ROOT)/git/git-alias-setting.sh
	@rm $(HOME)/.zshrc
	@ln -s $(ROOT)/zsh-set/.zshrc $(HOME)/.zshrc
	@mkdir -p $(HOME)/.config/nvim
	@ln -s $(ROOT)/nvim-set/config/nvim/init.vim $(HOME)/.config/nvim/init.vim
	@sh $(ROOT)/nvim-set/install.sh
