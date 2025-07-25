# Making this error accessible for the test file 
# was problematic: this is a fix copied from
# community solutions
class InvalidCodonError < EncodingError; end

class Translation

  AAC = AMINO_ACIDS_IN_CODONS = {
      methionine: ['AUG'],
      phenylalanine: ['UUU', 'UUC'],
      leucine: ['UUA', 'UUG'],
      serine: ['UCU', 'UCC', 'UCA', 'UCG'],
      tyrosine: ['UAU', 'UAC'],
      cysteine: ['UGU', 'UGC'],
      tryptophan: ['UGG'],
      stop: ['UAA', 'UAG', 'UGA']
  }

  def self.of_rna(strand)
    # Get codons from RNA strand
    codons = []
    until strand.empty?
      codons << strand.slice!(0..2)
    end
    # Take "stop" into account
    AAC.fetch(:stop).any? { |stop| 
      if codons.include?(stop) 
        codons.slice!(codons.index(stop)..-1)
      end  
    }
    # Validate strand length
    unless strand.length % 3 == 0
      raise InvalidCodonError.new
    end
    # Validate codons
    codons.each do |codon|
      unless AAC.values.flatten.include?(codon)
        raise InvalidCodonError.new
      end
    end
    # Get amino acids sequence from codons
    amino_acids = []
    codons.each do |codon|
      AAC.each_value do |aa|
        if aa.include?(codon)
          amino_acids.push(AAC.key(aa).to_s.capitalize!)
        end
      end
    end
    amino_acids
  end

end
