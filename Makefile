ifndef MG5DIR
override MG5DIR=mg5
endif
ifndef LIB
override LIB=libCepGenUserProcess.so
endif

PSRC=$(wildcard $(MG5DIR)/SubProcesses/P1_*/*.cc $(MG5DIR)/src/*.cc)
POBJ=$(PSRC:.cc=.o)
PDIR=$(dir $(PSRC))
PINC=$(PDIR:%=-I%)

CEPGEN_PATH := $(or $(CEPGEN_PATH), /usr)
CEPGEN_LIBS_DIR := $(or $(CEPGEN_LIBS_DIR), $(CEPGEN_PATH)/lib64)
CEPGEN_INCLUDE_DIR := $(or $(CEPGEN_INCLUDE_DIR), $(CEPGEN_PATH)/include)

CFLAGS=-I$(CEPGEN_INCLUDE_DIR) $(PINC) -L$(CEPGEN_LIBS_DIR) -lCepGenCore -fPIC -std=c++14 -Wall -pedantic -g

.PHONY: lib clean

lib: $(LIB)

%.o: %.cc
	@echo "Building $<"
	@$(CC) $(CFLAGS) $< -c -o $@

$(LIB): $(POBJ) MadGraphProcess.cpp
	@echo "Linking everything together into $@"
	@$(CC) $(CFLAGS) $^ -shared -o $@

clean:
	$(RM) -f *.o ${POBJ} $(LIB)
