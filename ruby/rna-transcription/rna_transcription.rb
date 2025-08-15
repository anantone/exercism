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
    