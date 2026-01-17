public class SalaryCalculator {
    public double salaryMultiplier(int daysSkipped) {
        return daysSkipped > 4 ? 0.85 : 1;
    }

    public int bonusMultiplier(int productsSold) {
        return productsSold > 19 ? 13 : 10;
    }

    public double bonusForProductsSold(int productsSold) {
        return productsSold * bonusMultiplier(productsSold);
    }

    public double finalSalary(int daysSkipped, int productsSold) {
        double total = 1000.00 * salaryMultiplier(daysSkipped) + bonusForProductsSold(productsSold);
        return total >= 2000.00 ? 2000.00 : total;
    } 
}
