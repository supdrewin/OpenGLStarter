GLAD_SOURCE_DIR = $(GIT_MODULE_DIR)/glad
GLAD_BUILD_DIR  = $(PWD)/build/glad

prepare/glad:
	$(CMAKE_COMMAND) \
		-S $(GLAD_SOURCE_DIR) \
		-B $(GLAD_BUILD_DIR) \
		-D BUILD_SHARED_LIBS=OFF \
		-D CMAKE_BUILD_TYPE=Release \
		--install-prefix $(PWD)
.PHONY: prepare/glad

build/glad: prepare/glad
	$(CMAKE_COMMAND) \
		--build $(GLAD_BUILD_DIR) \
		--parallel $(JOBS)
.PHONY: build/glad

install/glad: build/glad
	install -Dm644 -t $(PWD)/include/glad $(GLAD_BUILD_DIR)/include/glad/glad.h
	install -Dm644 -t $(PWD)/include/KHR $(GLAD_BUILD_DIR)/include/KHR/khrplatform.h
	install -Dm644 -t $(PWD)/lib $(GLAD_BUILD_DIR)/libglad.a
.PHONY: install/glad

uninstall/glad:
	rm -rf $(PWD)/include/glad
	rm -rf $(PWD)/include/KHR
	rm -f $(PWD)/lib/libglad.a
.PHONY: uninstall/glad

clean/glad:
	$(CMAKE_COMMAND) \
		--build $(GLAD_BUILD_DIR) \
		--target clean
.PHONY: clean/glad
