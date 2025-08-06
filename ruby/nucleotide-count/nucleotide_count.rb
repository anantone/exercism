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
    if @strand == ''
      return 0
    end
    count = 0
    @strand.each_char do |char|
      count += 1 if char == letter
    end
    count      
  end

  def histogram
    histogram = {}
    count_A, 
    count_T, 
    count_C, 
    count_G = [0, 0, 0, 0]
    unless @strand == ''
      @strand.each_char do |char|
        count_A += 1 if char == 'A'
        count_T += 1 if char == 'T'
        count_C += 1 if char == 'C'
        count_G += 1 if char == 'G'
      end
    end
    histogram['A'], 
    histogram['T'], 
    histogram['C'],
    histogram['G'], = [count_A, count_T, count_C, count_G]
    histogram
  end
  
end
