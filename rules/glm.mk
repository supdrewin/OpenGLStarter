GLM_SOURCE_DIR = $(GIT_MODULE_DIR)/glm
GLM_BUILD_DIR  = $(PWD)/build/glm

prepare/glm:
	$(CMAKE_COMMAND) \
		-S $(GLM_SOURCE_DIR) \
		-B $(GLM_BUILD_DIR) \
		-D BUILD_SHARED_LIBS=OFF \
		-D CMAKE_BUILD_TYPE=Release \
		--install-prefix $(PWD)
.PHONY: prepare/glm

build/glm: prepare/glm
	$(CMAKE_COMMAND) \
		--build $(GLM_BUILD_DIR) \
		--parallel $(JOBS)
.PHONY: build/glm

install/glm: build/glm
	$(CMAKE_COMMAND) \
		--build $(GLM_BUILD_DIR) \
		--target install
.PHONY: install/glm

uninstall/glm:
	$(CMAKE_COMMAND) \
		--build $(GLM_BUILD_DIR) \
		--target uninstall
.PHONY: uninstall/glm

clean/glm:
	$(CMAKE_COMMAND) \
		--build $(GLM_BUILD_DIR) \
		--target clean
.PHONY: clean/glm
