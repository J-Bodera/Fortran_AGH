all: clean cleanres build run plot

build:
	$(GFORTRAN) signals.F90 -o signals -lfftw3
	$(GFORTRAN) cosinus.F90 -o cosinus -lfftw3

run:
	./signals
	./cosinus

clean:
	rm -rf *.o signals cosinus

cleanres:
	rm -rf ../res/*

plot:
	gnuplot "draw_plots.plt"
