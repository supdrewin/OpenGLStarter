STB_SOURCE_DIR = $(GIT_MODULE_DIR)/stb
STB_BUILD_DIR  = $(PWD)/build/stb

prepare/stb:
.PHONY: prepare/stb

build/stb: prepare/stb
.PHONY: build/stb

install/stb: build/stb
	install -Dm644 -t $(PWD)/include $(STB_SOURCE_DIR)/stb_*.h
.PHONY: install/stb

uninstall/stb:
	rm -f $(PWD)/include/stb_*.h
.PHONY: uninstall/stb

clean/stb: prepare/stb
.PHONY: clean/stb
