unset grid
set terminal pdf
set output 'wykres4.pdf'
set key box top left
set multi
set logscale x
set logscale y
set key opaque
set key box
set key width 1 height 0.5 font "Arial, 14"
set style data lines
set termopt enhanced
set xlabel "N" font "Arial, 14"
set ylabel "multiplication time" font "Arial, 14"
set xtics font "Arial, 14"
set ytics font "Arial, 14"
set termoption dashed
plot [10: 1280] "naive_kind4.dat" title "naive"
replot [10: 1280] "better_kind4.dat" title "better"
replot [10: 1280] "dotmull_kind4.dat" title "dotmull"
replot [10: 1280] "matmull_kind4.dat" title "matmull"
unset multi