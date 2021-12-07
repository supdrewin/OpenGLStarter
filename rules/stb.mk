STB_SOURCE_DIR = $(GIT_MODULE_DIR)/stb
STB_BUILD_DIR  = $(PWD)/build/stb

prepare/stb:
.PHONY: prepare/stb

build/stb: prepare/stb
.PHONY: build/stb

install/stb: build/stb
	install -Dm644 -t $(PWD)/include/stb $(STB_SOURCE_DIR)/stb_*.h
.PHONY: install/stb

uninstall/stb:
	rm -rf $(PWD)/include/stb
.PHONY: uninstall/stb

clean/stb: prepare/stb
.PHONY: clean/stb
