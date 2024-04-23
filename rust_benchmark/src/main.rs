fn main() {
    let mut sum: u64 = 0;
    for number in 1..100_000_000 {
        sum += number;
    }
    println!("The sum of numbers from 1 to 100,000,000 is {}", sum);
}

