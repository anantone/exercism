<?php

class PizzaPi
{
    public function calculateDoughRequirement($pizzas, $people)
    {
        return $pizzas * (($people * 20) + 200);
    }

    public function calculateSauceRequirement($pizzas, $canVolume)
    {
        return $pizzas * 125 / $canVolume;
    }

    public function calculateCheeseCubeCoverage($cheeseCube, $cheeseLayer, $pizzaDiameter)
    {
        return floor($cheeseCube**3 / ($cheeseLayer * M_PI * $pizzaDiameter));
    }

    public function calculateLeftOverSlices($pizzas, $friends)
    {
        return ($pizzas * 8) % $friends;
    }
}
