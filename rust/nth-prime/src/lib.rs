pub fn nth(n: u32) -> u32 {
    fn prime(n: u32) -> bool {
        for number in 2..n {
            if n % number == 0 {
                return false
            }
        }
        true
    }
    let mut v: Vec<u32> = Vec::new();
    let mut i: u32 = 2;
    while v.len() <= n.try_into().unwrap() {
        if prime(i) {
            v.push(i);
        }
        i += 1
    }
    let Some(element) = v.last() else { return 0 };
    *element
}

