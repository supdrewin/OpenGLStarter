FREETYPE_SOURCE_DIR = $(GIT_MODULE_DIR)/freetype
FREETYPE_BUILD_DIR  = $(PWD)/build/freetype

prepare/freetype:
	$(CMAKE_COMMAND) \
		-S $(FREETYPE_SOURCE_DIR) \
		-B $(FREETYPE_BUILD_DIR) \
		-D BUILD_SHARED_LIBS=OFF \
		-D CMAKE_BUILD_TYPE=Release \
		--install-prefix $(PWD)
.PHONY: prepare/freetype

build/freetype: prepare/freetype
	$(CMAKE_COMMAND) \
		--build $(FREETYPE_BUILD_DIR) \
		--parallel $(JOBS)
.PHONY: build/freetype

install/freetype: build/freetype
	$(CMAKE_COMMAND) \
		--build $(FREETYPE_BUILD_DIR) \
		--target install
.PHONY: install/freetype

uninstall/freetype:
	rm -rf $(PWD)/include/freetype2
	rm -rf $(PWD)/lib/cmake/freetype
	rm -f $(PWD)/lib/pkgconfig/freetype2.pc
	rm -f $(PWD)/lib/libfreetype.a
.PHONY: uninstall/freetype

clean/freetype:
	$(CMAKE_COMMAND) \
		--build $(FREETYPE_BUILD_DIR) \
		--target clean
.PHONY: clean/freetype
