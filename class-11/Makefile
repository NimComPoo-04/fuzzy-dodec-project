JC = javac
JCF = -classpath class -d class
JI = java
JIF = -classpath class

SRC = $(wildcard src/*.java)

define NEWLINE


endef

build: $(SRC)
	$(foreach T, $(SRC), $(JC) $(JCF) $(T) $(NEWLINE))

compl:
	$(JC) $(JCF) $(X)

run:
	$(JI) $(JIF) $(X)

clean:
	rm class/*.class
