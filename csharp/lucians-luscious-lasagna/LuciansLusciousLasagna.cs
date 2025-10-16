class Lasagna
{
    public int ExpectedMinutesInOven() => 40;

    public int RemainingMinutesInOven(int ActualMinutesInOven)
    {
        return ExpectedMinutesInOven() - ActualMinutesInOven;
    }

    public int PreparationTimeInMinutes(int NumberOfLayers)
    {
        return NumberOfLayers * 2;
    }

    public int ElapsedTimeInMinutes(int NumberOfLayers, int ActualMinutesInOven)
    {
        return PreparationTimeInMinutes(NumberOfLayers) + ActualMinutesInOven;
    }
}
