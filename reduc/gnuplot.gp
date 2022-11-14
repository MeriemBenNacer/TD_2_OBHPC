set title "comparaison des versions en  gcc01"
ijk= "#252525";
set auto x
set style data histogram
set style fill solid border -1
set boxwidth 0.9
set xtic scale 0
plot 'gcc/gcc1/gcc1.dat' using 2:xtic(1) ti col fc rgb ijk
pause -1

