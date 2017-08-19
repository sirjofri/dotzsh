.PHONY: install
install: ~/.zshrc

~/.zshrc: zshrc
	ln -s ~/.zsh/zshrc ~/.zshrc
