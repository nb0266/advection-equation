set term gif animate delay 10
set output 'anime_advection.gif'
set yr[0:1.5]

num_frames=1000

do for [i=5:num_frames:5]{
plot sprintf('output%05d.txt',i) using 1:2 with lines lw 3 lc rgb "green" title "advection"
}

unset output 

exit 


