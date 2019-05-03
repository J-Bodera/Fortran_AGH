# Wyniki

Czasy działania poszczególnych napisanych funkcji oraz funkcji matmul wbudowanej w język zostały zmierzone dla macierzy kwadratowych kolejno o rozmiarach 10, 20, 40,...,1280. DOdatkowo pomiary zostały rozróżnione ze względu na precyzję danych znajdujących się w tablicach (kind = 4, 8, 16).

Poniżej zamieszczam wyniki przedstawione w postaci graficznej, która zostałą wykonanna przy użyciu gnuplot.

## KIND4
![kind4](https://github.com/J-Bodera/Fortran_AGH/blob/master/Task1/res/wykres4.jpg)
---
## KIND8
![kind8](https://github.com/J-Bodera/Fortran_AGH/blob/master/Task1/res/wykres8.jpg)
---
## KIND16
![kind16](https://github.com/J-Bodera/Fortran_AGH/blob/master/Task1/res/wykres16.jpg)
---

## Wnioski

Wyniki pomiarów dla precyzji kind równych 4 i 8 są dość podobne. 

Dla kind = 4 widać, że dla małych rozmiarów macierzy najszybsza okazuje się być funkcja dotmull, korzystająca z iloczynu skalarnego, jednak już od N = 20 najszybsza jest funkcja wbudowana. Natomiast funkcje better i naive działają najwolniej z marginalną różnicą między sobą, jedynie dla N = 10 są szybsze od funkcji wbudowanej.

W przypadku kind = 8 wyniki są podobne do kind = 4, najszybsza jest funkcja wbudowana, następnie dotmull i najwolniejsze naive i better - praktycznie bez róznicy między nimi.

Natomiast dla kind = 16 wszystkie funkcje działają w bardzo zbliżonym czasie i cięzko wybrać najlepszą, gdyż wykresy się pokrywają. Jedynie dla dużych rozmiarów niewielką przewagę uzyskuje funkcja wbudowana.
