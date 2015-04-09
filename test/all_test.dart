// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library labyrinth.test;

import 'package:unittest/unittest.dart';
import 'package:labyrinth/labyrinth.dart';

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
  group('Cell class should', () {
    Cell tenByTen, twoByTwo, sixByFive;

    setUp(() {
//      cell = new Cell(10, 10);
      tenByTen = new Cell(10, 10);
      twoByTwo = new Cell(2, 2);
      sixByFive = new Cell(6, 5);
    });

    test('be at correct position', () {
      expect(tenByTen.x, equals(10));
      expect(tenByTen.y, equals(10));

      expect(twoByTwo.x, equals(2));
      expect(twoByTwo.y, equals(2));

      expect(sixByFive.x, equals(6));
      expect(sixByFive.y, equals(5));
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

}