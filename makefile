# command options
CC := g++
RM := rm -rf
MV := mv
MKDIR := mkdir -p
FORMATTER := clang-format -i


# final executable name
EXENAME := auti-complexity


# compiler warnings
WARNINGS := --pedantic --pedantic-errors -Wall -Wextra -Wmissing-include-dirs\
-Wswitch-default -Wuninitialized -Wstrict-overflow=5 -Wsuggest-override\
-Wfloat-equal -Wshadow -Wundef -Wunused-macros -Wcast-qual -Wcast-align=strict\
-Wconversion -Wzero-as-null-pointer-constant -Wformat=2 -Wuseless-cast\
-Wextra-semi -Wsign-conversion -Wlogical-op -Wmissing-declarations\
-Wredundant-decls -Winline -Winvalid-pch -Wdisabled-optimization\
-Wctor-dtor-privacy -Wnoexcept -Wnon-virtual-dtor -Wstrict-null-sentinel\
-Wold-style-cast -Woverloaded-virtual -Wsign-promo

# compiler options
OPTIONS := -std=c++17 -m64 $(WARNINGS)
DEBUGOPTIONS := -Og -ggdb -Wno-unused
RELEASEOPTIONS := -O3 -D NDEBUG -Wunused


.PHONY: debug release clean diagnose
.SECONDEXPANSION:
.SUFFIXES:

debug: OPTIONS := $(OPTIONS) $(DEBUGOPTIONS)
debug: $(EXENAME)

release: OPTIONS := $(OPTIONS) $(RELEASEOPTIONS)
release: $(EXENAME)


clean:
	$(RM) $(EXENAME)

$(EXENAME): calculator.cc
	$(CC) -o $(EXENAME) $(OPTIONS) calculator.cc