class HighScores:
    def __init__(self, scores):
        self.scores = scores

    def latest(self):
        return self.scores[-1]

    def personal_best(self):
        return max(self.scores)

    def personal_top_three(self):
        scores_to_sort = self.scores[:]
        scores_to_sort.sort(reverse=True)
        return scores_to_sort[:3]
        