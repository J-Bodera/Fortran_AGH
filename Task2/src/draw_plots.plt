set terminal png size 1200, 800
set style data lines
set key off
set xtics font "Arial, 14"
set ytics font "Arial, 14"

set output "../res/signals_time.png"
set xlabel "x" font "Arial, 14"
set ylabel "y" font "Arial, 14"
set title "Sinus FFT" font "Arial, 18"
plot "../res/signals_time"

set output "../res/signals_freq.png"
set xlabel "Frequency" font "Arial, 14"
set ylabel "Amplitude" font "Arial, 14"
set title "Sinus FFT" font "Arial, 18"
plot "../res/signals_freq"

set output "../res/cosinus.png"
set xlabel "x" font "Arial, 14"
set ylabel "y" font "Arial, 14"
set title "Cosinus" font "Arial, 18"
plot "../res/cosinus"

set output "../res/cosinus_noise.png"
set xlabel "x" font "Arial, 14"
set ylabel "y" font "Arial, 14"
set title "Cosinus with noise" font "Arial, 18"
plot "../res/cosinus_noise"

set output "../res/cosinus_fft.png"
set xlabel "Amplitude" font "Arial, 14"
set ylabel "Frequency" font "Arial, 14"
set title "Cosinus FFT" font "Arial, 18"
plot [0:80]"../res/cosinus_fft"

set output "../res/cosinus_fft_fixed.png"
set xlabel "Amplitude" font "Arial, 14"
set ylabel "Frequency" font "Arial, 14"
set title "Cosinus FFT - fixed" font "Arial, 18"
plot [0:80] "../res/cosinus_fft_fixed"

set output "../res/cosinus_reduced_noise.png"
set xlabel "x" font "Arial, 14"
set ylabel "y" font "Arial, 14"
set title "Cosinus with reduced noise" font "Arial, 18"
plot "../res/cosinus_reduced_noise"
