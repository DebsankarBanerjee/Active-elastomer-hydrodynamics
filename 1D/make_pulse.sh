clear

rm -r graph/

mkdir -p data
mkdir -p graph

#****************************************************
# strating loop for parameters

# sample parameters are set to show the different phases -
# mu=3 (Stable)
# mu=5.5 (Spontaneous Oscillatory)
# mu=7.0 (Spontaneous Moving)
# mu=7.5 (Spatio-temporal chaos)
# mu=8.2 (Contractile Collapse)
			
			

# loop for mu
		
for var2 in 3 5.5 7 7.5 8.2			
do
#		->>>>loop_1<<<<-

# loop for B
for var1 in 8			
do
#		->>>>loop_2<<<<-
echo 'for B' ${var1}
echo 'and mu_' ${var2}

printf "%f %f" $var1 $var2>'code/para_file.txt'
printf "%f" $var1>'code/var1_file.txt'
printf "%f" $var2>'code/var2_file.txt'
var1=$(<code/var1_file.txt)
var2=$(<code/var2_file.txt)

echo 'running the makefile and executable'
echo 'entering /code'	
cd code

make clean
make
make clean
	
time ./result.exe<para_file.txt 

#rm para_file.txt
rm var1_file.txt
rm var2_file.txt
cd ..

#**************** SAVE GRAPH AND DATA *********************
## set graph_flag = 0 to stop saving graph
graph_flag=1

if [ "$graph_flag" -eq 1 ]; then 
echo 'plotting graphs of the system'
gnuplot plot.gp
gnuplot profile_plot.gp
gnuplot cfl_plot.gp

echo 'done'

cp data/info.txt graph/plots_B_${var1}_mu__${var2}.txt
#tar -czvf data/density.tar.gz data/density.txt data/time_evolution.txt
#mv data/density.tar.gz graph

cd graph
mkdir "plots_B_${var1}_mu_${var2}"
mv *.png plots_B_${var1}_mu_${var2}
mv *.eps plots_B_${var1}_mu_${var2}
mv *.txt plots_B_${var1}_mu_${var2}
mv *.tar.gz plots_B_${var1}_mu_${var2}

#mkdir "B_${var1}"
#mv plots_B${var1}_* B_${var1}/
#cd ..

cd ..
fi

#-------------------------------
echo 'removing files'

cd code
rm result.exe
cd ..

#cd data
#rm *.txt
#cd ..

#		->>>>loop_2<<<<<-
done


#		->>>>loop_1<<<<-
done



clear
echo 'This script is finished'
echo -e "\a"
echo -e "\a"
echo -e "\a"
echo '---------------End----------------'
#beep



