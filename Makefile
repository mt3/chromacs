VERSION=$(shell bin/get-chromacs-version.bash)
NAME=builds/chromacs-$(VERSION).crx

all: $(NAME)

$(NAME): manifest.json chromacs.js
	crxmake --pack-extension-key=${HOME}/etc/chromacs.pem \
		--extension-output=$(NAME) \
		--pack-extension=. \
		--ignore-dir="(bin|builds|.git)" \
		--ignore-file="(Makefile|.gitignore)"

clean:
	rm -f $(NAME)

tag: $(NAME)
	git tag "$(VERSION)"
