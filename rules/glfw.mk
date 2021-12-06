GLFW_SOURCE_DIR = $(GIT_MODULE_DIR)/glfw
GLFW_BUILD_DIR  = $(PWD)/build/glfw

prepare/glfw:
	$(CMAKE_COMMAND) \
		-S $(GLFW_SOURCE_DIR) \
		-B $(GLFW_BUILD_DIR) \
		-D GLFW_BUILD_WAYLAND=ON \
		-D GLFW_USE_HYBRID_HPG=ON \
		-D BUILD_SHARED_LIBS=OFF \
		-D CMAKE_BUILD_TYPE=Release \
		--install-prefix $(PWD)
.PHONY: prepare/glfw

build/glfw: prepare/glfw
	$(CMAKE_COMMAND) \
		--build $(GLFW_BUILD_DIR) \
		--parallel $(JOBS)
.PHONY: build/glfw

install/glfw: build/glfw
	$(CMAKE_COMMAND) \
		--build $(GLFW_BUILD_DIR) \
		--target install
.PHONY: install/glfw

uninstall/glfw:
	$(CMAKE_COMMAND) \
		--build $(GLFW_BUILD_DIR) \
		--target uninstall
.PHONY: uninstall/glfw

clean/glfw:
	$(CMAKE_COMMAND) \
		--build $(GLFW_BUILD_DIR) \
		--target clean
.PHONY: clean/glfw
