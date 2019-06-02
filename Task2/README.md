
# Programownaie w języku Fortran - projekt 2
## Program
### Pliki
W katalogu **src** jest plik Makefile, w którym zadeklarowane są polecenia do uruchomienia programu.

Plik **src/signals.F90** to kod realizujący 1 część zadania
Plik **src/cosinus.F90** to kod realizujący 2 część zadania
Plik **src/draw_plots.plt** to instrukcje do wykonania wykresów przy pomocy gnulpot

W katalogu **res** znajdują się pliki z wynikami oraz wygenerowane wykresy przez gnuplot
### Uruchamianie
Po pobraniu kodu źródłowego, z poziomu katalogu **src** wydajemy komendę:
```
make all
```
Program zostanie skompilowany i uruchomiony. Wyniki zostaną zapisane w katalogu **res**. Następnie zostaną wygenerowane wykresy przy pomocy gnuplot, które wraz z wynikami zostaną zapisane w katalogu **res**.

## Sprawozdanie
### Transformata sygnału złożonego.
Dla sygnału danego wzorem: 
**f(t)=sin(2πt*200)+2sin(2πt*400)**,
jego wykres w dziedzinie czasu na przedziale **0<x<1** wygląda nastepująco:

![alt text](https://github.com/J-Bodera/Fortran_AGH/blob/master/Task2/res/signals_time.png)

Następnie wykonałem tranformate Fouriera na powyższym sygnale, otrzymując wykres amplitudy od częstotliwości.
Dzięki temu można zauważyć z jakich częstotliwości złożony jest sygnał.
![alt text](https://github.com/J-Bodera/Fortran_AGH/blob/master/Task2/res/signals_freq.png)

Dzięki tej operacji można łatwo odczytać częstotliwości sygnałów składających się na wygnał wyjściowy - charakterystyczne piki. 
Ich częstotliwości to odpowiednio **200Hz** i **400Hz**.
Gdyby nie tranfsormata Fouriera określenie tych wartości z wykresu z dziedziną czasu byłoby znacznie cięższe.

### Zastosowanie transformaty Fouriera do filtracji zaszumionego sygnału.
Naszym sygnałem wejściowym będzie cosinus.
Jego wykres w dziedzinie czasu, wygląda następująco:

![alt text](https://github.com/J-Bodera/Fortran_AGH/blob/master/Task2/res/cosinus.png)

Następnie dodałem szumy do sygnału, przez losowe wartości. Sygnał z szumami:

![alt text](https://github.com/J-Bodera/Fortran_AGH/blob/master/Task2/res/cosinus_noise.png)

Otrzymany zaszumiony sygnał poddałem tranformacie Fouriera. Wynik transformaty:

![alt text](https://github.com/J-Bodera/Fortran_AGH/blob/master/Task2/res/cosinus_fft.png)

Widać, że oprócz pojedynczego wyraźnego piku, wystapuje dużo innych mniejszych. Są to właśnie częstotliwości szumów które dodaliśmy uprzednio. 
NNastępnie usuwam wszystkie wartości mniejsze od 50, otrzymując:

![alt text](https://github.com/J-Bodera/Fortran_AGH/blob/master/Task2/res/cosinus_fft_fixed.png)

Dzięki temu uzyskałem pojedynczy sygnał.
Następnie działam odwrotnie do poprzedniego kroku, czyli wykonuję odwrotną transformatę Fouriera sygnału. Otrzymuję wykres dziedziny czasu:

![alt text](https://github.com/J-Bodera/Fortran_AGH/blob/master/Task2/res/cosinus_reduced_noise.png)

Jak widać otrzymany sygnał jest niemal identyczny jak wejściowy sygnał, od którego zaczynałem. Widać, że sygnał jest znacznie lepszy niż zaszumiony początkowy sygnał.

### Wnioski ###
Szybka transformata Fouriera jest bardzo przydatnym narzędziem przy przetwarzaniu sygnałów, aby pozbyć się zakłóceń w sygnałach.
