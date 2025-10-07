class HighScores:
    def __init__(self, scores):
        self.scores = scores

    def latest(self):
        return self.scores[-1]

    def personal_best(self):
        return max(self.scores)

    def personal_top_three(self):
        top_three = []
        for score in self.scores:
            if len(top_three) < 3:
                top_three.append(score)
            elif score > min(top_three):
                top_three[-1] = score
            top_three.sort(reverse=True)
        return top_three