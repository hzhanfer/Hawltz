DEBUG_MODE=

HAWLTZ= hawltz
LIBHAWLTZ= libhawltz.

INST_DIR= $(shell if [ -n "$${PREFIX+x}" ]; then echo $$PREFIX; else echo /usr/local; fi;)
INST_BIN_DIR= $(INST_DIR)/bin
INST_INCLUDE_DIR= $(INST_DIR)/include
INST_LIB_DIR= $(INST_DIR)/lib

INSTALLED_HAWLTZ= $(INST_BIN_DIR)/hawltz
INSTALELD_HEADER_DIR= $(INST_INCLUDE_DIR)/hawltz
INSTALLED_LIBHAWLTZ= $(INST_LIB_DIR)/$(LIBHAWLTZ)

SRC_DIR= src

C_FILES= $(shell find $(SRC_DIR) -type f -name "*.c")
O_FILES= $(C_FILES:.c=.o)

HEADER_DIR= $(SRC_DIR)/hawltz

RM= rm
MV= mv
CP= cp
CHMOD= chmod

CC= clang
CC_FLAGS=\
 -Wall -Wextra -std=c99 -pedantic \
 -I$(SRC_DIR) \
 -ffunction-sections -fdata-sections

LD= $(CC)
LD_FLAGS=\
 -Wl,--gc-sections

ifneq ($(DEBUG_MODE),)
CC_FLAGS+= -g -O0 -D__DEBUG_MODE__
else
CC_FLAGS+= -O2
LD_FLAGS+= -Wl,--strip-all
endif


.RECIPEPREFIX= >
.PHONY: all install uninstall clean


all: $(HAWLTZ)


install: $(HAWLTZ)
> $(MV) $(HAWLTZ) $(INST_BIN_DIR)
> $(CP) -r $(HEADER_DIR) $(INST_INCLUDE_DIR)
> $(CHMOD) +x $(INSTALLED_HAWLTZ) -R $(INSTALELD_HEADER_DIR)

uninstall:
> $(RM) $(INST_INCLUDE_DIR) -r $(INSTALELD_HEADER_DIR)


$(HAWLTZ): $(O_FILES)
> $(LD) $^ -o $@ $(LD_FLAGS)


%.o: %.c
> $(CC) -c $< -o $@ $(CC_FLAGS)


clean:
> $(RM) -f $(O_FILES)