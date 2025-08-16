NUCLEOTIDES = {
  G: 'C',
  C: 'G',
  T: 'A',
  A: 'U'  
}

module Complement
  def self.of_dna(dna)
    rna = ''
    dna.each_char do |char|
      rna += NUCLEOTIDES[char.to_sym]
    end
    rna
  end
end
    