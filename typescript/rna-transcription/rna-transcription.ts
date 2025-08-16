export function toRna(dna: string): string {
  let nucleotides = new Map<string, string>([
        ["G", "C"],
        ["C", "G"],
        ["T", "A"],
        ["A", "U"]
    ]);
  let rna = '';
  for (const nucleotide of dna) {
    if (nucleotides.has(nucleotide)) {
      rna += nucleotides.get(nucleotide)
    } else {
      throw new Error('Invalid input DNA.');
    }
  }
  return rna;
}
