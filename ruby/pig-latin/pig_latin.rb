module PigLatin
  VOWELS = %w[a e i o u].freeze

  def self.translate(text)
    text.split.map { |word| translate_word(word) }.join(' ')
  end

  def self.translate_word(word)
    case word
    # Rule 1: starts with vowel, or "xr"/"yt"
    when /\A([aeiou]|xr|yt)/
      "#{word}ay"
    # Rule 2: "qu" preceded by consonants (e.g. "square")
    when /\A([^aeiou]*qu)(.*)/
      "#{$2}#{$1}ay"
    # Rule 3: "y" acting as a vowel (e.g. "my", "rhythm")
    when /\A([^aeiou]+)(y.*)/
      "#{$2}#{$1}ay"
    # Rule 4: leading consonant cluster
    when /\A([^aeiou]+)(.*)/
      "#{$2}#{$1}ay"
    else
      "#{word}ay"
    end
  end
end