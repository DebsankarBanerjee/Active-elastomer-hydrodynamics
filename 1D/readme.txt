This code was used to produce the figures in the article named: "Actomyosin pulsation and flows in an active elastomer with turnover and network remodeling"

all codes written by: Deb Sankar Banerjee

codes are run on Linux-ubuntu only. Compatibility for other platforms are not checked.

--------------- steps to run the code ---------------

1. run the shell script file (in terminal)-

path to the shell scrpt/ ./make_pulse.sh

(in case of permission issue use: chmod -0755 make_pulse.sh)

2. this should generate "data" and "graph" directories. The plots are mostly labelled and saved in respective sub-dir inside graph according to the parameter values.

3. data was not saved for each run but can be done by uncommenting the following lines in the script:
   #tar -czvf data/density.tar.gz data/density.txt data/time_evolution.txt
   #mv data/density.tar.gz graph
   any file name added in the place of "density.txt" will be saved in the respective plots_* dir inside graph
   all parameter values are saved in file plots_B_XX_mu_XX.txt in respective plots_* dir inside graph

4. Do not change the file named "makefile" unless any .f90 files are added or removed from the dir "code"





