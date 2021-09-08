
set term pngcairo 
set size 1,1
set output "graph/density.png"

set xlabel "Time"
set ylabel "Space"
set title "Density Plot"
set pm3d map
set cbrange [0:]
set palette rgbformulae 22,13,10
splot 'data/density.txt' u 1:2:3 title " "

reset

set term pngcairo 
set size 1,1
set output "graph/strain.png"

set xlabel "Time"
set ylabel "Space"
set title "Strain Plot"
set pm3d map
set cbrange []
set palette rgbformulae 22,13,10
splot 'data/strain.txt' u 1:2:3 title " "



reset

# TIME EVOLUTION:

set term pngcairo 
set xlabel 'time'
set ylabel 'mean density'
set output 'graph/r_t.png'
set grid
plot [][] 'data/time_evolution.txt' u 1:2 w lp ps 0.2 lc 1 title " "


