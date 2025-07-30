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
    # Validate strand length, codons
    unless strand.length % 3 == 0 && codons.all? do
      |codon| AAC.values.flatten.include?(codon)
        end
      raise InvalidCodonError.new
    end
    # Get amino acids sequence from codons
    amino_acids = codons.map do |codon|
      translate_codon_to_amino_acid(codon)[0]
    end
    amino_acids
  end

  def self.translate_codon_to_amino_acid(codon)
    AAC.filter_map do |key, aa|
        key.to_s.capitalize! if aa.include?(codon)
      end
  end

end
