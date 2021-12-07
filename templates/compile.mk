CXX      := clang++
CXXFLAGS += -std=c++2a -stdlib=libc++
CXXFLAGS += -I$(PREFIX)/include
CXXFLAGS += -finline-functions
CXXFLAGS += -Wall -Weffc++ -Wextra -Wsign-conversion -pedantic-errors
CXXFLAGS +=	-pipe -glldb -O2 -o $(PREFIX)/$@
LDFLAGS  += -fuse-ld=lld -flto=thin -L$(PREFIX)/lib
LDFLAGS  += -lassimp -ldl -lfreetype -lglad -lglfw3 -lpthread -lstb -lzlibstatic

bin/$(PROJECT): *.cpp
	$(CXX) $(CXXFLAGS) $^ $(LDFLAGS)
.PHONY: bin/$(PROJECT)
