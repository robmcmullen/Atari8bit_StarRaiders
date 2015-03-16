
.PHONY : test copy default clean

default : starraiders.xex

starraiders.xex : starraiders.o
	ld65 -o starraiders.xex -C starraiders.lnk starraiders.o

starraiders.lst starraiders.o : starraiders.s
	ca65 -l starraiders.lst starraiders.s -o starraiders.o

clean :
	$(RM) *.o *~ *.map *.lst starraiders.xex
