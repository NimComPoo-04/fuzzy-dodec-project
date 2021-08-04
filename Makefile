JC = javac
JF = --class-path class -d class
JR = java
JRF = --class-path class

SRC = $(wildcard src/*.java)

CLASS = $(wildcard class/*.class)

DOC = doc/main.tex

all: compile

compile: $(SRC)
	$(foreach T, $^, $(call compl))

run: $(patsubst class/%_main.java, class/%_main.java, $(CLASS))
	$(foreach T, $(patsubst class/%.class, %, $^), $(call runc))

run-each::
	$(JR) $(JRF) $(basename $(var))

document: $(DOC)
	pdflatex --output-directory doc/output $^
	make4ht --output-dir doc/output $^

clean:
	- rm class/* -f
	- rm doc/output/* -f

.PHONY : run-each document clean run compile all

define compl
$(JC) $(JF) $(T)

endef

define runc
$(JR) $(JRF) $(T)

endef

define dcompl

endef
