
class BirdWatcher {
    private final int[] birdsPerDay;

    public BirdWatcher(int[] birdsPerDay) {
        this.birdsPerDay = birdsPerDay.clone();
    }

    public int[] getLastWeek() {
        int[] lastWeek = {0, 2, 5, 3, 7, 8, 4};
        return lastWeek;
    }

    public int getToday() {
        return this.birdsPerDay[6];
    }

    public void incrementTodaysCount() {
        this.birdsPerDay[6]++;
    }

    public boolean hasDayWithoutBirds() {
        for (int day: this.birdsPerDay) {
            if (day == 0) {
                return true;
            }
        }
        return false;
    }

    public int getCountForFirstDays(int numberOfDays) {
        int sum = 0;
        if (numberOfDays > this.birdsPerDay.length) {
            for (int num : this.birdsPerDay) {
                sum += num;
            }
        } else {
            for (int i = 0; i < numberOfDays; i++) {
                sum += this.birdsPerDay[i];
            }
        }
        return sum;
    }

    public int getBusyDays() {
        int busyDays = 0;
        for (int day: this.birdsPerDay) {
            if (day > 4) {
                busyDays++;
            }
        }
        return busyDays;
    }
}
