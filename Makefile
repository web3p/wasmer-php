PHP_PREFIX_BIN= $(shell php-config --prefix)/bin
SRC= $(shell pwd)/src
COMPOSER= $(shell which composer)

default: build

build:
	cd $(SRC) &&  echo $(shell pwd) && \
	$(PHP_PREFIX_BIN)/phpize --clean && \
	$(PHP_PREFIX_BIN)/phpize && \
	./configure CXX='g++' CXXFLAGS='-std=c++11' --with-php-config=$(PHP_PREFIX_BIN)/php-config && \
	make install

test:
	$(PHP_PREFIX_BIN)/php $(COMPOSER) test

bench:
	$(PHP_PREFIX_BIN)/php $(COMPOSER) bench