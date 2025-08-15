export class DnDCharacter {
  strength:       number;
  dexterity:      number;
  constitution:   number;
  intelligence:   number;
  wisdom:         number;
  charisma:       number;
  hitpoints:      number;

  constructor() {
    this.strength       = DnDCharacter.generateAbilityScore(4, 3);
    this.dexterity      = DnDCharacter.generateAbilityScore(4, 3);
    this.constitution   = DnDCharacter.generateAbilityScore(4, 3);
    this.intelligence   = DnDCharacter.generateAbilityScore(4, 3);
    this.wisdom         = DnDCharacter.generateAbilityScore(4, 3);
    this.charisma       = DnDCharacter.generateAbilityScore(4, 3);
    this.hitpoints      = 10 + DnDCharacter.getModifierFor(this.constitution);
  }

  public static getModifierFor(abilityValue: number): number {
    return Math.floor((abilityValue - 10) / 2);
  }

  public static generateAbilityScore(rolls: number = 4, top: number = 3): number {
    let numbers: number[] = Array();
    for (let i = 0; i < rolls; i++) {
      numbers.push(DnDCharacter.getRandomInt(1, 6));
    }
    const sortedNumbers = numbers.sort((a, b) => b - a);
    return sortedNumbers.slice(0, top).reduce((accumulator, currentValue) => accumulator + currentValue, 0);
  }

  public static getRandomInt(min: number, max: number): number {
    return Math.floor(Math.random() * (max - min)) + min;
  }
}
