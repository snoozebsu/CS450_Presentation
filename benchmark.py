def main():
    sum = 0
    for i in range(100000000):
        sum += i
    return sum


if __name__ == "__main__":
    print(main())
