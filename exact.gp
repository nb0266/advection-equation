#set term gif animate delay 100 optimize size 640,480 
#set output 'anime_compare.gif'
set yr [0:20] 


#plot sprintf('output_00100.txt') using 1:2 with lines lc rgb"blue" 
#replot sprintf('exact_00100.txt') using 1:2 with points

plot 'output_00100.txt' using 1:2 with lines lc rgb "blue" title "numerical solution"
replot 'exact_00100.txt' using 1:2 with points lc rgb "black" title "exact solution"

#unset output
set terminal png
set output 'anime_compare.png'
replot
exit
