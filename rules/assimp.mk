ASSIMP_SOURCE_DIR = $(GIT_MODULE_DIR)/assimp
ASSIMP_BUILD_DIR  = $(PWD)/build/assimp

prepare/assimp: check/cmake
	$(CMAKE_COMMAND) \
		-S $(ASSIMP_SOURCE_DIR) \
		-B $(ASSIMP_BUILD_DIR) \
		-D ASSIMP_BUILD_ZLIB=ON \
		-D BUILD_SHARED_LIBS=OFF \
		-D CMAKE_BUILD_TYPE=Release \
		--install-prefix $(PWD)
.PHONY: prepare/assimp

build/assimp: prepare/assimp
	$(CMAKE_COMMAND) \
		--build $(ASSIMP_BUILD_DIR) \
		--parallel $(JOBS)
.PHONY: build/assimp

install/assimp: build/assimp
	$(CMAKE_COMMAND) \
		--build $(ASSIMP_BUILD_DIR) \
		--target install
.PHONY: install/assimp

uninstall/assimp: check/cmake
	$(CMAKE_COMMAND) \
		--build $(ASSIMP_BUILD_DIR) \
		--target uninstall
.PHONY: uninstall/assimp

clean/assimp: check/cmake
	$(CMAKE_COMMAND) \
		--build $(ASSIMP_BUILD_DIR) \
		--target clean
.PHONY: clean/assimp
