class HighScores:
    def __init__(self, scores):
        self.scores = scores

    def latest(self):
        return self.scores[-1]

    def personal_best(self):
        return max(self.scores)

    def personal_top_three(self):
        scores_to_sort = self.scores.copy()
        return sorted(scores_to_sort, reverse=True)[:3]
        