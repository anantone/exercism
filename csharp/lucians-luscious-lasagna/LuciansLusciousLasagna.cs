class Lasagna
{
    public int ExpectedMinutesInOven() => 40;

    public int RemainingMinutesInOven(int ActualMinutesInOven) => ExpectedMinutesInOven() - ActualMinutesInOven;

    public int PreparationTimeInMinutes(int NumberOfLayers) => NumberOfLayers * 2;

    public int ElapsedTimeInMinutes(int NumberOfLayers, int ActualMinutesInOven) => PreparationTimeInMinutes(NumberOfLayers) + ActualMinutesInOven;
}
