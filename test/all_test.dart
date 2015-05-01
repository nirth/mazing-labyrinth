// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library labyrinth.test;

import 'package:test/test.dart';
import '../lib/labyrinth.dart';

main() {
  sanitySpecs();
  cellSpecs();
  gridSpecs();
}

void sanitySpecs() {
  group('Sanity should', () {
    setUp(() {

    });

    test('be sane', () {
      expect(true, isTrue);
      expect(false, isFalse);
    });
  });
}

void cellSpecs() {
  group('Cells should', () {
    Cell zeroByZero, oneByZero, zeroByOne, oneByOne, tenByTen, twoByTwo, sixByFive;

    setUp(() {
//      cell = new Cell(10, 10);
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
    });

    test('be initialized at correct position', () {
      expect(tenByTen.row, equals(10));
      expect(tenByTen.column, equals(10));

      expect(twoByTwo.row, equals(2));
      expect(twoByTwo.column, equals(2));

      expect(sixByFive.row, equals(6));
      expect(sixByFive.column, equals(5));
    });

    test('have an ability to link to each other', () {
      expect(zeroByZero.linked(oneByZero), false);
      expect(oneByZero.linked(zeroByZero), false);
      zeroByZero.link(oneByZero);
      expect(zeroByZero.linked(oneByZero), true);
      expect(oneByZero.linked(zeroByZero), true);
    });

    test('have an ability to link to multiple cells', () {
      zeroByZero.link(oneByZero);
      expect(zeroByZero.linked(oneByZero), true);
      expect(oneByZero.linked(zeroByZero), true);

      zeroByZero.link(zeroByOne);
      expect(zeroByZero.linked(zeroByOne), true);
      expect(zeroByOne.linked(zeroByZero), true);
    });

    test('have an ability to unlink all connected links', () {
      zeroByZero.link(oneByZero);
      expect(zeroByZero.linked(oneByZero), true);
      expect(oneByZero.linked(zeroByZero), true);

      zeroByZero.link(zeroByOne);
      expect(zeroByZero.linked(zeroByOne), true);
      expect(zeroByOne.linked(zeroByZero), true);

      zeroByZero.unlinkAll();
      expect(zeroByZero.linked(oneByZero), false);
      expect(oneByZero.linked(zeroByZero), false);

      expect(zeroByZero.linked(zeroByOne), false);
      expect(zeroByOne.linked(zeroByZero), false);
    });

    test('have toString method', () {
      expect(twoByTwo.toString(), contains('2'));
      expect(tenByTen.toString(), contains('10'));
      expect(sixByFive.toString(), contains('6'));
      expect(sixByFive.toString(), contains('5'));
    });
  });
}

void gridSpecs() {
  group('Grids should', () {
    Grid oneByOne, twoByTwo, fiveBySeven;

    setUp(() {
      oneByOne = new Grid(1, 1);
      twoByTwo = new Grid(2, 2);
      fiveBySeven = new Grid(5, 7);
    });

    test('report correct rows and columns count', () {
      expect(oneByOne.rows, 1);
      expect(oneByOne.columns, 1);

      expect(twoByTwo.rows, 2);
      expect(twoByTwo.columns, 2);

      expect(fiveBySeven.rows, 5);
      expect(fiveBySeven.columns, 7);
    });

    test('report correct size', () {
      expect(oneByOne.size, 1);

      expect(twoByTwo.size, 4);

      expect(fiveBySeven.size, 35);
    });

    test('retrieve correct cell at position', () {
      Cell zeroByZero = oneByOne.cellAt(0, 0);
      expect(zeroByZero.row, 0);
      expect(zeroByZero.column, 0);

      Cell twoByThree = fiveBySeven.cellAt(2, 3);
      Cell oneBySix = fiveBySeven.cellAt(1, 6);

      expect(twoByThree.row, 2);
      expect(twoByThree.column, 3);

      expect(oneBySix.row, 1);
      expect(oneBySix.column, 6);
    });

    test('retrieve null when trying to access cell at invalid coordinates', () {
      expect(oneByOne.cellAt(-1, 0), null);
      expect(oneByOne.cellAt(2, 2), null);

      expect(fiveBySeven.cellAt(-1, -1), null);
      expect(fiveBySeven.cellAt(10, 6), null);
      expect(fiveBySeven.cellAt(7, 7), null);
    });

    test('iterate over it\'s cells row by row', () {
      int count = 0;

      fiveBySeven.forEach((cell) {
        count += 1;
      });

      expect(count, 35);
    });

    test('iterate over it\'s cells in correct order', () {
      int row = 0;
      int column = 0;

      fiveBySeven.forEach((cell) {
        expect(cell.row, row);
        expect(cell.column, column);

        column += 1;

        if (column >= fiveBySeven.columns) {
          column = 0;
          row += 1;
        }
      });
    });

  });
}