set term pngcairo
set output 'graph/u_profile.png'
set xlabel 'space'
set ylabel 'displacement field'
plot 'data/data_u.txt' u 1:2 w lp ps 0.5 pt 4 lc 1 title "initial",'data/data_u.txt' u 1:3 w lp ps 0.5 pt 6 lc 7 title "final"

reset

set term pngcairo
set output 'graph/r_profile.png'
set xlabel 'space'
set ylabel 'density of bound myosin'
plot 'data/data_r.txt' u 1:2 w lp ps 0.5 pt 4 lc 1 title "initial",'data/data_r.txt' u 1:3 w lp ps 0.5 pt 6 lc 7 title "final"
reset

set term pngcairo
set output 'graph/s_profile.png'
set xlabel 'space'
set ylabel 'strain'
plot 'data/data_s.txt' u 1:2 w lp ps 0.5 pt 4 lc 1 title "initial",'data/data_s.txt' u 1:3 w lp ps 0.5 pt 6 lc 7 title "final"
reset

set term pngcairo
set output 'graph/stress_profile.png'
set xlabel 'space'
set ylabel 'active and elastic stress'
plot 'data/data_stress.txt' u 1:2 w lp ps 0.5 pt 4 lc 1 title "elastic",'data/data_stress.txt' u 1:3 w lp ps 0.5 pt 6 lc 7 title "active"
reset

set term pngcairo
set output 'graph/force_profile.png'
set xlabel 'space'
set ylabel 'active and elastic force'
plot 'data/data_force.txt' u 1:2 w lp ps 0.5 pt 4 lc 1 title "elastic",'data/data_force.txt' u 1:3 w lp ps 0.5 pt 6 lc 7 title "active"
reset
