export function toRna(dna: string): string {
  const nucleotides = 'GCTA';
  let rna = '';
  for (const nucleotide of dna) {
    if (nucleotides.includes(nucleotide)) {
      rna += convert(nucleotide)
    } else {
      throw new Error('Invalid input DNA.');
    }
  }
  return rna;
}

export function convert(nucleotide: string): any {
  if (nucleotide == 'G') {
    return 'C';
  } else if (nucleotide == 'C') {
    return 'G';
  } else if (nucleotide == 'T') {
    return 'A';
  } else if (nucleotide == 'A') {
    return 'U';
  }
}
