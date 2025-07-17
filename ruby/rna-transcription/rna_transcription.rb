=begin
Write your code for the 'Rna Transcription' exercise in this file. Make the tests in
`rna_transcription_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/rna-transcription` directory.
=end

module Complement
  def self.of_dna(dna)
    rna = ''
    dna.each_char do |char|
      if char == 'G'
        rna += 'C'
      elsif char == 'C'
        rna += 'G'
      elsif char == 'T'
        rna += 'A'
      elsif char == 'A'
        rna += 'U'
      end
    end
    rna
  end
end
    