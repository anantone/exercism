class InvalidCodonError < EncodingError
  def initialize(message='There is at least one invalid codon in your strand. ' \
                'You should check for typos. If none, maybe you are looking ' \
                'at DNA instead??')
    super
  end
end

class Translation

  CAA = CODONS_PER_AMINO_ACID = {
       Methionine: ['AUG'],
    Phenylalanine: ['UUU', 'UUC'],
          Leucine: ['UUA', 'UUG'],
           Serine: ['UCU', 'UCC', 'UCA', 'UCG'],
         Tyrosine: ['UAU', 'UAC'],
         Cysteine: ['UGU', 'UGC'],
       Tryptophan: ['UGG'],
             stop: ['UAA', 'UAG', 'UGA']
  }

  private_constant :CAA

  def self.of_rna(strand)
    new(strand).to_s
  end

  private

  attr_writer :protein

  def initialize(strand)
    triplets = slice_rna(strand)
    trim = until_stop(triplets)
    codons = validate(trim)
    raise InvalidCodonError unless codons == trim
    self.protein = codons.map do |codon|
      translate(codon)
    end
  end

  def slice_rna(strand)
    strand.chars.each_slice(3).map { |triplet| triplet.join }
  end

  def until_stop(triplets)
    triplets.take_while { |triplet| !CAA[:stop].include?(triplet) }
  end

  def validate(triplets)
    triplets.select do |triplet|
      CAA.values.flatten.include?(triplet)
    end
  end

  def translate(codon)
    CAA.each_pair do |amino_acid, matches|
      return amino_acid.to_s if matches.include?(codon)
    end
  end

  public

  attr_reader :protein

  alias to_s protein

end
