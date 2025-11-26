pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    let mut multiples = vec![];
    for factor in factors {
        for number in 1..limit {
            if *factor != 0 && number % factor == 0 && !multiples.contains(&number) {
                multiples.push(number);
            }
        }
    }
    multiples.into_iter().sum()
}
