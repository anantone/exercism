pub fn is_armstrong_number(num: u32) -> bool {
    if num == 0 {
    return true
    }
    let power = num.ilog10() + 1_u32;
    let digits_sum = num.to_string()
    .chars()
    .map(|c| c.to_digit(10).unwrap().pow(power))
    .sum();
    num == digits_sum
}
