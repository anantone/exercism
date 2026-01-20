public class CarsAssemble {

    public static final int CARS_PER_HOUR = 221;

    public double productionRatePerHour(int speed) {
        if (speed < 5) {
            return speed * CARS_PER_HOUR;
        } 
        if (speed < 9) {
            return speed * CARS_PER_HOUR * 0.9;
        } 
        if (speed == 9) {
            return speed * CARS_PER_HOUR * 0.8;
        }
        return speed * CARS_PER_HOUR * 0.77;
    }

    public int workingItemsPerMinute(int speed) {
        return (int) productionRatePerHour(speed) / 60;
    }
}
