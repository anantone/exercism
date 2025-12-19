pub fn reply(message: &str) -> &str {
    let message = message.trim();
    let is_yelling = message.chars().any(|c| c.is_alphabetic()) && message == message.to_uppercase();
    let is_question = message.ends_with('?');
    if is_yelling && is_question {
        "Calm down, I know what I'm doing!"
    } else if is_yelling {
        "Whoa, chill out!"
    } else if is_question {
        "Sure."
    } else if message.is_empty() {
        "Fine. Be that way!"
    } else {
        "Whatever."
}
}

