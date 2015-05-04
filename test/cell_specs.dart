part of labyrinth.test;

void cellSpecs() {
  group('Cells should', () {
    Cell zeroByZero, oneByZero, zeroByOne, oneByOne, tenByTen, twoByTwo, sixByFive;

    setUp(() {
      tenByTen = new Cell(10, 10);
      twoByTwo = new Cell(2, 2);
      sixByFive = new Cell(6, 5);

      zeroByZero = new Cell(0, 0);
      oneByZero = new Cell(1, 0);
      zeroByOne = new Cell(0, 1);
      oneByOne = new Cell(1, 1);
    });

    tearDown(() {
      zeroByZero.unlinkAll();
      oneByZero.unlinkAll();
      zeroByOne.unlinkAll();
      oneByOne.unlinkAll();

      zeroByZero.north = null;
      zeroByZero.east = null;
      zeroByZero.south = null;
      zeroByZero.west = null;
    });

    test('be initialized at correct position', () {
      expect(tenByTen.row, equals(10));
      expect(tenByTen.column, equals(10));

      expect(twoByTwo.row, equals(2));
      expect(twoByTwo.column, equals(2));

      expect(sixByFive.row, equals(6));
      expect(sixByFive.column, equals(5));
    });

    test('have toString method', () {
      expect(twoByTwo.toString(), contains('2'));
      expect(tenByTen.toString(), contains('10'));
      expect(sixByFive.toString(), contains('6'));
      expect(sixByFive.toString(), contains('5'));
    });
  });
}