.PHONY: default
default: compile link

PROGRAM := Testbench.bsv
BUILD_DIR := $(PWD)/build
FLAGS := -keep-fires -aggressive-conditions
# -------------------------------------------------------
# Bluesim compile/link/simulate

.PHONY: compile
compile:
	@echo Compiling for Bluesim ...
	bsc -sim -g mkTestbench -simdir $(BUILD_DIR) -bdir $(BUILD_DIR) $(FLAGS) $(PROGRAM)
	@echo Compiling for Bluesim finished

.PHONY: link
link:
	@echo Linking for Bluesim ...
	bsc -sim -e mkTestbench -o $(BUILD_DIR)/out -simdir $(BUILD_DIR) -bdir $(BUILD_DIR)
	@echo Linking for Bluesim finished

.PHONY: simulate
simulate:
	@echo Bluesim simulation ..
	$(BUILD_DIR)/out -V
	@echo Bluesim simulation finished

# ------------------------------------------------------

.PHONY: clean
clean:
	cd $(BUILD_DIR);\
	rm -f *.bo *.ba mk* *.cxx *.h *.o

.PHONY: real_clean
real_clean:
	cd $(BUILD_DIR);\
	rm -f *.bo *.ba mk* *.cxx *.h *.o;\
	rm -f out out.so out_v *.v
