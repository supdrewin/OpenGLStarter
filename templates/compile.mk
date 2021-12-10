CXX      := clang++

CXXFLAGS += -std=c++2a -stdlib=libc++ -I$(PREFIX)/include
CXXFLAGS += -flto=thin -finline-functions -fstack-protector-strong
CXXFLAGS += -Wall -Weffc++ -Wextra -Wsign-conversion -pedantic-errors
CXXFLAGS +=	-pipe -glldb -O2 -o $(PREFIX)/$@

LDFLAGS  += -fpie -fuse-ld=lld -rtlib=compiler-rt -unwindlib=libunwind -L$(PREFIX)/lib
LDFLAGS  += -lassimp -ldl -lfreetype -lgcc -lglad -lglfw3 -lpthread -lstb -lzlibstatic

bin/$(PROJECT): *.cpp
	$(CXX) $(CXXFLAGS) $^ $(LDFLAGS)
.PHONY: bin/$(PROJECT)
