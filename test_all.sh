!#/bin/bash
TIMEFORMAT='It took %R seconds'
printf "\n\n";
# testing c
echo 'Testing C'
rm *.out
time {
	gcc benchmark.c
	./a.out
}

# testing python
printf "\n\nTesting Python 3\n"
time {
	python benchmark.py
}

# testing java 17
printf "\n\nTesting Java 17 with JVM optimizations\n"
rm *.class
time {
	javac Benchmark.java
	java Benchmark
}

# testing java 17 without optimizations
printf "\n\nTesting Java 17 without JVM optimiazations\n"
rm *.class
time {
	javac Benchmark.java
	java Benchmark -Djava.compiler=NONE
}
