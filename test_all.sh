#!/bin/bash

# get run options from command line
attempt="${1:-1}"
limit=50

# Ensure that a numeric argument is provided
if [[ ! $attempt =~ ^[0-9]+$ ]]; then
    echo "Please provide a numeric argument."
    exit 1
fi
echo "------------------------------------"
echo "Number of attempts: $attempt"
echo "------------------------------------"


TIMEFORMAT='It took %R seconds'
printf "\n\n";
# # testing c
# echo 'Testing C Unoptimized'
# # remove old remnents
# cd c_no_opt
# make clean
#
# time {
# 	make > /dev/null
# 	for ((i=0; i<$attempt; i++))
# 	do
# 		./benchmark > /dev/null
# 	done
# }
# cd ../

# testing c
echo
echo 'Testing C Optimized'
# remove old remnents
cd c_opt
make clean

time {
	make > /dev/null
	for ((i=0; i<$attempt; i++))
	do
		./benchmark > /dev/null
	done
}
cd ../

# testing python
printf "\n\nTesting Python 3\n"
if [ $attempt -lt $limit ]; then 
	time {
		for ((i=0; i<$attempt; i++))
		do
			python benchmark.py > /dev/null
		done
	}
else
	echo "aborting Python 3 test"
fi

# testing python with a more "pythonic" method (cheat using c)
printf "\n\nTesting Python 3 with sum function\n"
if [ $attempt -lt $limit ]; then
	time {
		for ((i=0; i<$attempt; i++))
		do
			python benchmark2.py > /dev/null
		done
	}
else
	echo "aborting Python 3 sum() test"
fi

# testing ruby
printf "\n\nTesting Ruby\n"
if [ $attempt -lt $limit ]; then 
	time {
		for ((i=0; i<$attempt; i++))
		do
			ruby benchmark.rb > /dev/null
		done
	}
else
	echo "aborting Ruby test"
fi

# testing ruby with a more "ruby" method using reduce
# printf "\n\nTesting Ruby with Reduce\n"
# if [ $attempt -lt $limit ]; then
# 	time {
# 		for ((i=0; i<$attempt; i++))
# 		do
# 			ruby benchmark_ruby_way.rb > /dev/null
# 		done
# 	}
# else
# 	echo "aborting Ruby with Reduce"
# fi

# # testing java 17
# printf "\n\nTesting Java 17 without JVM optimizations\n"
#
# filename="Benchmark.class"
# if [ -f "$filename" ]; then
# 	rm "$filename"
# 	echo "Benchmark.class deleted"
# fi
#
# time {
# 	javac Benchmark.java
# 	for ((i=0; i<$attempt; i++))
# 	do
# 		java Benchmark > /dev/null
# 	done
# }
#
# # testing java 17 without optimizations
# printf "\n\nTesting Java 17 with JVM optimiazations\n"
#
# if [ -f "$filename" ]; then
# 	rm "$filename"
# 	echo "Benchmark.class deleted"
# fi
#
# time {
# 	javac Benchmark.java
# 	for ((i=0; i<$attempt; i++))
# 	do
# 		java Benchmark -Xint > /dev/null
# 	done
# }

# # testing rust
# printf "\n\nTesting Rust with no optimizations"
#
# cd rust_benchmark
# cargo clean
#
# time {
# 	cargo build --quiet
# 	cd target/debug
# 	for ((i=0; i<$attempt; i++))
# 	do
# 		./rust_benchmark > /dev/null
# 	done
# 	cd ../..
# }
#
# cd ..

# testing optimized rust
printf "\n\nTesting Rust with optimizations"

cd rust_benchmark
cargo clean

time {
	cargo build --release --quiet
	cd target/release
	for ((i=0; i<$attempt; i++))
	do
		./rust_benchmark > /dev/null
	done
	cd ../..
}

cd ..

# CBM basic for grins
# echo
# echo 'Testing CBM basic with 1/10 the range'
# echo 'Only going to iterate one time'
# echo
# time {
# 	cbmbasic benchmark.bas > /dev/null
# }
