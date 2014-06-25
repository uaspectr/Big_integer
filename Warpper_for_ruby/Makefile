all:
	swig -c++ -ruby Big_integer.i
	g++ -fPIC -c Big_integer.cpp
	g++ -fPIC -c Big_integer_wrap.cxx -I/usr/include/ruby-2.0.0 -I/usr/include/x86_64-linux-gnu/ruby-2.0.0
	g++ -shared Big_integer.o Big_integer_wrap.o -o _Big_integer.so
clear:
	rm Big_integer.o Big_integer_wrap.cxx Big_integer_wrap.o
