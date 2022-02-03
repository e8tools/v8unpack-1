#------------------------------------------------------------------------------#
# This makefile was generated by 'cbp2make' tool rev.147                       #
#------------------------------------------------------------------------------#


WORKDIR = `pwd`

CC = gcc
CXX = g++
AR = ar
LD = g++
WINDRES = 

INC = 
CFLAGS = -Wall -std=c++14
RESINC = 
LIBDIR = 
LIB = -static -lz -lboost_filesystem -lboost_system
LDFLAGS = 

INC_RELEASE = $(INC)
CFLAGS_RELEASE = $(CFLAGS) -O2
RESINC_RELEASE = $(RESINC)
RCFLAGS_RELEASE = $(RCFLAGS)
LIBDIR_RELEASE = $(LIBDIR)
LIB_RELEASE = $(LIB) 
LDFLAGS_RELEASE = $(LDFLAGS) -s
OBJDIR_RELEASE = obj/Release
DEP_RELEASE = 
OUT_RELEASE = bin/Release/v8unpack

OBJ_RELEASE = $(OBJDIR_RELEASE)/src/V8File.o $(OBJDIR_RELEASE)/src/main.o  $(OBJDIR_RELEASE)/src/utils.o \
			  $(OBJDIR_RELEASE)/src/VersionFile.o $(OBJDIR_RELEASE)/src/placeholder216.o
PREFIX=$(DESTDIR)/usr/bin
BASH_COMPLETION_PREFIX=$(DESTDIR)/etc/bash_completion.d

all: release

install: $(OUT_RELEASE)
	test -d $(PREFIX) || mkdir -p $(PREFIX)
	cp bin/Release/v8unpack $(PREFIX)/v8unpack
	test -d $(BASH_COMPLETION_PREFIX) || mkdir -p $(BASH_COMPLETION_PREFIX)
	cp bash_completion.sh $(BASH_COMPLETION_PREFIX)/v8unpack

uninstall:
	rm $(PREFIX)/v8unpack
	rm $(BASH_COMPLETION_PREFIX)/v8unpack

clean: clean_release

before_release: bin/Release

bin/Release:
	test -d bin/Release || mkdir -p bin/Release
	test -d $(OBJDIR_RELEASE)/src || mkdir -p $(OBJDIR_RELEASE)/src

after_release: 

release: $(OUT_RELEASE) after_release

$(OUT_RELEASE): bin/Release $(OBJ_RELEASE) $(DEP_RELEASE)
	$(LD) $(LIBDIR_RELEASE) -o $(OUT_RELEASE) $(OBJ_RELEASE)  $(LDFLAGS_RELEASE) $(LIB_RELEASE)

$(OBJDIR_RELEASE)/src/V8File.o: src/V8File.cpp src/V8File.h src/VersionFile.h
	$(CXX) -D__LINUX $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/V8File.cpp -o $(OBJDIR_RELEASE)/src/V8File.o

$(OBJDIR_RELEASE)/src/main.o: src/main.cpp src/V8File.h
	$(CXX) -D__LINUX $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/main.cpp -o $(OBJDIR_RELEASE)/src/main.o

$(OBJDIR_RELEASE)/src/utils.o: src/utils.cpp src/V8File.h
	$(CXX) -D__LINUX $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/utils.cpp -o $(OBJDIR_RELEASE)/src/utils.o

$(OBJDIR_RELEASE)/src/VersionFile.o: src/VersionFile.cpp src/VersionFile.h
	$(CXX) -D__LINUX $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/VersionFile.cpp -o $(OBJDIR_RELEASE)/src/VersionFile.o

$(OBJDIR_RELEASE)/src/placeholder216.o: src/placeholder216.cpp
	$(CXX) -D__LINUX $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/placeholder216.cpp -o $(OBJDIR_RELEASE)/src/placeholder216.o

clean_release: 
	rm -f $(OBJ_RELEASE) $(OUT_RELEASE)
	rm -rf bin/Release
	rm -rf $(OBJDIR_RELEASE)/src

.PHONY: before_release after_release clean_release install uninstall

