STB_SOURCE_DIR = $(GIT_MODULE_DIR)/stb
STB_BUILD_DIR  = $(PWD)/build/stb

ifneq ($(shell command -v llvm-ar), '')
AR             = llvm-ar
endif

prepare/stb:
	mkdir -p $(STB_BUILD_DIR)
	cat $(STB_SOURCE_DIR)/*.h |\
		grep IMPLEMENTATION |\
		grep ifdef |\
		sed s/ifdef/define/g \
		>$(STB_BUILD_DIR)/stb.h
	$(PWD)/rules/stb.sh \
		$(STB_SOURCE_DIR) \
		$(STB_BUILD_DIR)
.PHONY: prepare/stb

build/stb: prepare/stb
	-cd $(STB_BUILD_DIR) && $(CC) -I$(STB_SOURCE_DIR) -c *.c
	-cd $(STB_BUILD_DIR) && $(AR) $(ARFLAGS) libstb.a `ls *.o`
.PHONY: build/stb

install/stb: build/stb
	install -Dm644 -t $(PWD)/include/stb $(STB_SOURCE_DIR)/stb_*.h
	install -Dm644 -t $(PWD)/lib $(STB_BUILD_DIR)/libstb.a
.PHONY: install/stb

uninstall/stb:
	rm -rf $(PWD)/include/stb
	rm -f $(PWD)/lib/libstb.a
.PHONY: uninstall/stb

clean/stb:
	rm -rf $(STB_BUILD_DIR)
.PHONY: clean/stb
