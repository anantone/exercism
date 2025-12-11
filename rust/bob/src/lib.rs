pub fn reply(message: &str) -> &str {
    if  message.chars().any(|c| c.is_alphabetic()) && message == message.to_uppercase() && message.trim().ends_with('?') {
        "Calm down, I know what I'm doing!"
    } else if message.chars().any(|c| c.is_alphabetic()) && message == message.to_uppercase() {
        "Whoa, chill out!"
    } else if message.trim().ends_with('?') {
        "Sure."
    } else if message.trim().is_empty() {
        "Fine. Be that way!"
    } else {
        "Whatever."
    }
}
