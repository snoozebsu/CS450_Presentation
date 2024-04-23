# Makefile for compiling benchmark.c

# Compiler settings - Can be customized.
CC=gcc
CFLAGS=-Wall -g -O3

# Target executable name
TARGET=benchmark

# Build target
all: $(TARGET)

# Link the object file to create the executable
$(TARGET): benchmark.o
	$(CC) benchmark.o -o $(TARGET)

# Compile the source file into an object file
benchmark.o: benchmark.c
	$(CC) $(CFLAGS) -c benchmark.c

# Clean target
clean:
	rm -f $(TARGET) benchmark.o


