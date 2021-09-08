set term pngcairo
set xlabel 'time'
set ylabel 'CFL number'
set output 'graph/cfl.png'
set grid
plot [][] 'data/cfl.txt' u 1:2 w p ps 0.4 pt 4 lc 7 title " "


rese

set term pngcairo
set xlabel 'time'
set ylabel 'EK'
set output 'graph/kin_energy.png'
set grid
plot [][] 'data/cfl.txt' u 1:3 w lp ps 0.4 pt 4 lc 7 title " "
