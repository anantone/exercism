class InvalidCodonError(Exception):
    def __init__(self, message="There is at least one invalid codon in your strand. You should check for typos. If none, maybe you are looking at DNA instead??"):
        super().__init__(message)


class Translation:
    CODONS_PER_AMINO_ACID = {
        "Methionine":    ["AUG"],
        "Phenylalanine": ["UUU", "UUC"],
        "Leucine":       ["UUA", "UUG"],
        "Serine":        ["UCU", "UCC", "UCA", "UCG"],
        "Tyrosine":      ["UAU", "UAC"],
        "Cysteine":      ["UGU", "UGC"],
        "Tryptophan":    ["UGG"],
        "stop":          ["UAA", "UAG", "UGA"],
    }
    _CODON_TO_AMINO_ACID = {
        codon: amino
        for amino, codons in CODONS_PER_AMINO_ACID.items()
        for codon in codons
    }

    def __init__(self, strand):
        triplets = self._slice_rna(strand)
        before_stop = self._trim_at_stop(triplets)
        valid = [t for t in before_stop if t in self._CODON_TO_AMINO_ACID]
        if valid != before_stop:
            raise InvalidCodonError()
        self.protein = [self._CODON_TO_AMINO_ACID[c] for c in valid]

    @staticmethod
    def _slice_rna(strand):
        return [strand[i:i + 3] for i in range(0, len(strand), 3)]

    @classmethod
    def _trim_at_stop(cls, triplets):
        result = []
        for triplet in triplets:
            if triplet in cls.CODONS_PER_AMINO_ACID["stop"]:
                break
            result.append(triplet)
        return result


def proteins(strand):
    """Translate an RNA strand into a list of amino acids."""
    translation = Translation(strand)
    return translation.protein