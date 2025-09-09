class InvalidCodonError < EncodingError; end

class Translation

  CAA = CODONS_PER_AMINO_ACID = {
       methionine: ['AUG'],
    phenylalanine: ['UUU', 'UUC'],
          leucine: ['UUA', 'UUG'],
           serine: ['UCU', 'UCC', 'UCA', 'UCG'],
         tyrosine: ['UAU', 'UAC'],
         cysteine: ['UGU', 'UGC'],
       tryptophan: ['UGG'],
             stop: ['UAA', 'UAG', 'UGA']
  }

  private_constant :CAA

  def self.of_rna(strand)
    new(strand).protein
  end

  private

  attr_writer :protein

  def initialize(strand)
    triplets = slice_rna(strand)
    trim = until_stop(triplets)
    codons = validate(trim)
    raise InvalidCodonError unless codons == trim
    self.protein = sequence_of_amino_acids(codons)
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

  def sequence_of_amino_acids(codons)
    codons.map do |codon|
      CAA.filter_map do |amino_acid, codons|
        amino_acid.to_s.capitalize if codons.include?(codon)
      end
    end.flatten
  end

  public

  attr_reader :protein

end

if $PROGRAM_NAME == __FILE__
  my_strand = 'UUCUUCUAAUGG'
  puts 'My strand is %s, I will need this later.' % my_strand
  puts Translation.of_rna(my_strand)
  puts 'Here is my strand for the next person to work on: %p' % my_strand
end

