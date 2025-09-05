NUCLEOTIDES = {
  'G': 'C',
  'C': 'G',
  'T': 'A',
  'A': 'U'
}

def to_rna(dna_strand):
    rna = ''
    for char in dna_strand:    
      rna += NUCLEOTIDES[char]
    return rna
