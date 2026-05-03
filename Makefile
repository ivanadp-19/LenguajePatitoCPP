CXX = g++
CXXFLAGS = -std=c++17 -Wall

patito: main.cpp parser.tab.c lex.yy.c
	$(CXX) $(CXXFLAGS) -o patito main.cpp parser.tab.c lex.yy.c

parser.tab.c parser.tab.h: parser.y
	bison -d parser.y

lex.yy.c: lexer.l parser.tab.h
	flex lexer.l

clean:
	rm -f patito lex.yy.c parser.tab.c parser.tab.h