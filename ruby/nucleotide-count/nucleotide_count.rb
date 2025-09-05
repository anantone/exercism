class Nucleotide
  
  def self.from_dna(strand)
    valid_nucleotides = %w(A G C T)
    unless strand.chars.all? { |x| valid_nucleotides.include?(x) }
      raise ArgumentError, "Invalid RNA nucleotide."  
    end
    Nucleotide.new(strand)
  end

  def initialize(strand)
    @strand = strand
  end

  def count(letter)
    @strand.count(letter)
  end

  def histogram
    Hash['A' => count('A'), 'T' => count('T'), 'C' => count('C'), 'G' => count('G')]
  end
  
end
