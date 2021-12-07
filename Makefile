SHELL            = /bin/sh

GIT_MODULE_DIR   = $(PWD)/modules
MAKE_INCLUDE_DIR = $(PWD)/rules

CMAKE_COMMAND    = $(shell command -v cmake)
GIT_COMMAND      = $(shell command -v git)

JOBS             = $(shell nproc)

default: check/git
	$(GIT_COMMAND) submodule update --remote

modules: check/git
	-$(GIT_COMMAND) init -q
	-$(GIT_COMMAND) submodule add https://github.com/assimp/assimp.git modules/assimp
	-$(GIT_COMMAND) submodule add https://github.com/freetype/freetype.git modules/freetype
	-$(GIT_COMMAND) submodule add https://github.com/Dav1dde/glad.git modules/glad
	-$(GIT_COMMAND) submodule add https://github.com/glfw/glfw.git modules/glfw
	-$(GIT_COMMAND) submodule add https://github.com/g-truc/glm.git modules/glm
	-$(GIT_COMMAND) submodule add https://github.com/nothings/stb.git modules/stb
.PHONY: modules

prepare: prepare/assimp prepare/freetype prepare/glad prepare/glfw prepare/glm prepare/stb
build: build/assimp build/freetype build/glad build/glfw build/glm build/stb
install: install/assimp install/freetype install/glad install/glfw install/glm install/stb
uninstall: uninstall/assimp uninstall/freetype uninstall/glad uninstall/glfw uninstall/glm uninstall/stb
clean: clean/assimp clean/freetype clean/glad clean/glfw clean/glm clean/stb

include $(MAKE_INCLUDE_DIR)/assimp.mk
include $(MAKE_INCLUDE_DIR)/freetype.mk
include $(MAKE_INCLUDE_DIR)/glad.mk
include $(MAKE_INCLUDE_DIR)/glfw.mk
include $(MAKE_INCLUDE_DIR)/glm.mk
include $(MAKE_INCLUDE_DIR)/stb.mk

check: check/cmake check/git

check/cmake:
	@if [ "$(CMAKE_COMMAND)" = "" ]; then echo error: \`cmake\' not found! && exit 1; fi
.PHONY: check/git

check/git:
	@if [ "$(GIT_COMMAND)" = "" ]; then echo error: \`git\' not found! &&  exit 1; fi
.PHONY: check/git
