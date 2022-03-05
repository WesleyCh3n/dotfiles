UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	PRINTF = printf
	SHELL := /usr/local/bin/zsh
else
	PRINTF = env printf
	SHELL := /usr/bin/zsh
endif

# Control the build verbosity
ifeq ("$(VERBOSE)","1")
	Q :=
else
	Q := @
endif

PASS_COLOR = \e[32;01m
NO_COLOR = \e[0m
