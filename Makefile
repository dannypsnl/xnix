ROOT = $(shell pwd)

.PHONY: install
install: install-git install-zsh install-neovim
	@touch $(HOME)/.local.sh
	@touch $(HOME)/.company.env

.PHONY: install-git
install-git:
	@git config --global commit.template $(ROOT)/git/git-message.txt
	@git config --global --add core.excludesfile $(ROOT)/git/.gitignore
	@sh $(ROOT)/git/git-alias-setting.sh

.PHONY: install-zsh
install-zsh:
	@[ -f $(HOME)/.zshrc ] && rm $(HOME)/.zshrc || true
	@ln -s $(ROOT)/zsh-set/.zshrc $(HOME)/.zshrc
	@sh $(ROOT)/zsh-set/install.sh
	@touch $(HOME)/.local.sh
	@touch $(HOME)/.company.env

.PHONY: install-neovim
install-neovim:
	@mkdir -p $(HOME)/.config/nvim
	@ln -s $(ROOT)/nvim-set/config/nvim/init.vim $(HOME)/.config/nvim/init.vim
	@sh $(ROOT)/nvim-set/install.sh
