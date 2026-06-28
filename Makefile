DEBUG_MODE=

HAWLTZ= hawltz

INST_DIR= $(shell if [ -n "$${PREFIX+x}" ]; then echo $$PREFIX; else echo /usr/local; fi;)
INST_BIN_DIR= $(INST_DIR)/bin

SRC_DIR= src

C_FILES= $(shell find $(SRC_DIR) -type f -name "*.c")
O_FILES= $(C_FILES:.c=.o)

RM= rm
MV= mv
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

uninstall:
> $(RM) $(INST_BIN_DIR)/$(HAWLTZ)


$(HAWLTZ): $(O_FILES)
> $(LD) $^ -o $@ $(LD_FLAGS)


%.o: %.c
> $(CC) -c $< -o $@ $(CC_FLAGS)


clean:
> $(RM) -f $(O_FILES)