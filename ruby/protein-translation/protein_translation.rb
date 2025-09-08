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

  private_constant :AAC

  def initialize(strand)
    codons = rna_to_codons(strand)
    codons = stop?(codons)
    validate_codons_data(strand, codons)
    self.rna = sequence_of_amino_acids(codons)
  end

  private

  attr_writer :rna

  def rna_to_codons(strand)
    # Get codons from RNA strand
    codons = []
    until strand.empty?
      codons << strand.slice!(0..2)
    end
    codons
  end

  def stop?(codons)
    # Shorten the codons array if "stop" is present
    AAC.fetch(:stop).any? do |stop|
      codons.slice!(codons.index(stop)..-1) if codons.include?(stop)
      end
    codons
  end

  def validate_codons_data(strand, codons)
    # Validate strand length and codons content
    unless strand.length % 3 == 0 && codons.all? do
      |codon| AAC.values.flatten.include?(codon)
        end
      raise InvalidCodonError.new
    end
  end

  def sequence_of_amino_acids(codons)
    # For each element of the codons array, get the corresponding amino acid
    codons.map do |codon|
      codon_to_amino_acid(codon)[0]
    end
  end

  def codon_to_amino_acid(codon)
    # For each codon, return the corresponding amino acid
    AAC.filter_map do |key, aa|
        key.to_s.capitalize if aa.include?(codon)
      end
  end

  public

  attr_reader :rna

  def self.of_rna(strand)
    new(strand).rna
  end

end
