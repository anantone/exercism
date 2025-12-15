pub fn is_armstrong_number(num: u32) -> bool {
    let power = num.to_string().len();
    let digits: Vec<u32> = num.to_string()
    .chars()
    .map(|c| c.to_digit(10).unwrap().pow(power.try_into().unwrap()))
    .collect();
    num == digits.iter().sum()   
}
