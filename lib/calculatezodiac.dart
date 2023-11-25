
  String calculatezodiac(int year) {
    const zodiacs = [
      'Empty','Rat', 'Ox', 'Tiger', 'Rabbit', 'Dragon', 'Snake',
      'Horse', 'Goat', 'Monkey', 'Rooster', 'Dog', 'Pig'
    ];
    
    return zodiacs[((year - 1900) % 12)+1];

  }