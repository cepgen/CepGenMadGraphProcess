FSRC=$(wildcard HELAS/*.f *.f)
FOBJ=$(FSRC:.f=.f.o)

ifndef LIB
override LIB=libCepGenUserProcess.so
endif
CEPGEN_PATH := $(or $(CEPGEN_PATH), /usr)
CEPGEN_LIBS_DIR := $(or $(CEPGEN_LIBS_DIR), $(CEPGEN_PATH)/lib64)
CEPGEN_INCLUDE_DIR := $(or $(CEPGEN_INCLUDE_DIR), $(CEPGEN_PATH)/include)

FF := $(or $(FF), gfortran)
FFLAGS=-I$(CEPGEN_INCLUDE_DIR) -L$(CEPGEN_LIBS_DIR) -lCepGenCore -fPIC
CFLAGS=-I$(CEPGEN_INCLUDE_DIR) -L$(CEPGEN_LIBS_DIR) -lCepGenCore -fPIC -std=c++14 -Wall -pedantic

.PHONY: lib clean

lib: $(LIB)

%.f.o: %.f
	echo $(FSRC)
	$(FF) $(FFLAGS) $< -c -o $@

$(LIB): $(FOBJ) MadGraphProcess.cpp
	$(CC) $(CFLAGS) $^ -shared -o $@

clean:
	$(RM) -f *.o HELAS/*.o $(LIB)
