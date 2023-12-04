FC=gfortran
EXT=f90

FFLAGS_g95      = -g -pedantic -Wall -fbounds-check -ftrace=full
FFLAGS_gfortran = -g -pedantic -Wall -Wimplicit-interface -Wunderflow -fbounds-check -fimplicit-none
FFLAGS_ifort    = -g -debug full -implicitnone -check -warn -free -Tf
FFLAGS_nagfor   = -g -gline -u -info -colour


# Select the right flags for the current compiler
FFLAGS=$(FFLAGS_$(FC))

all: euler

factorial.o: ./factorial.$(EXT)
	$(FC) $(FFLAGS) -o $@ -c $^

factorial: factorial.o
	$(FC) $(FFLAGS) -o $@ $^

euler.o: ./euler.$(EXT)
	$(FC) $(FFLAGS) -o $@ -c $^

euler: euler.o
	$(FC) $(FFLAGS) -o $@ $^

clean:
	@ rm -f *.o *.mod factorial euler