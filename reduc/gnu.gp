set title "comparaison entre les flags"
v01= "#252525"; v02="#ff2525"; v03="#ff2526"
set auto x
set style data histogram
set style histogram cluster gap 1
set style fill solid border -1
set boxwidth 1
set xtic scale 0
plot 'fixev.dat' using 2:xtic(1) ti col fc rgb v01,  '' u 4 ti col fc rgb v02,
pause -1
