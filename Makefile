PRODUCT_NAME := SetupProject

.PHONY: setup
setup:
	$(MAKE) install-bundler
	$(MAKE) install-mint-packages

.PHONY: install-bundler
install-bundler:
	bundle install

.PHONY: install-mint-packages
install-mint-packages:
	mint bootstrap --overwrite y
