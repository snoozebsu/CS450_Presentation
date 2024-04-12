!#/bin/bash
#rm *.out
#start=$(date +%s%N)
#	gcc benchmark.c
#	./a.out
#end=$(date +%s%N)
#echo "Elapsed Time: $(($end-$start)) seconds"
TIMEFORMAT='It took %R seconds'
rm *.out
time {
	gcc benchmark.c
	./a.out
}
