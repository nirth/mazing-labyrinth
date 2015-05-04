part of labyrinth.test;

void cellLinksSpecs() {
  group('Cells in grids should', () {
    Grid g;
    Cell c00, c01, c02, c03, c04,
         c10, c11, c12, c13, c14,
         c20, c21, c22, c23, c24,
         c30, c31, c32, c33, c34,
         c40, c41, c42, c43, c44;

    setUp(() {
      g = new Grid(5, 5);

      c00 = g.cellAt(0, 0); c01 = g.cellAt(0, 1); c02 = g.cellAt(0, 2); c03 = g.cellAt(0, 3); c04 = g.cellAt(0, 4);
      c10 = g.cellAt(1, 0); c11 = g.cellAt(1, 1); c12 = g.cellAt(1, 2); c13 = g.cellAt(1, 3); c14 = g.cellAt(1, 4);
      c20 = g.cellAt(2, 0); c21 = g.cellAt(2, 1); c22 = g.cellAt(2, 2); c23 = g.cellAt(2, 3); c24 = g.cellAt(2, 4);
      c30 = g.cellAt(3, 0); c31 = g.cellAt(3, 1); c32 = g.cellAt(3, 2); c33 = g.cellAt(3, 3); c34 = g.cellAt(3, 4);
      c40 = g.cellAt(4, 0); c41 = g.cellAt(4, 1); c42 = g.cellAt(4, 2); c43 = g.cellAt(4, 3); c44 = g.cellAt(4, 4);
    });

    group('be able to link and should', () {
      setUp(() {
        c12.linkNorth();
        c22.linkNorth();
        c11.linkSouth();

        c12.linkWest();
        c22.linkEast();
      });

      test('indicate that they are linked in simple example', () {
        expect(c00.linkedSouth, false);
        expect(c00.linked(c00.south), false);

        c00.linkSouth();

        expect(c00.linkedSouth, true);
        expect(c00.linked(c00.south), true);

        expect(c10.linkedNorth, true);
        expect(c10.linked(c00), true);
      });

      test('indicate that cell 1x2 connected to 2x2 on south', () {
        expect(c12.linkedSouth, true);
        expect(c22.linkedNorth, true);
      });

      test('indicate that cell 1x2 connected to 0x2 on north', () {
        expect(c12.linkedNorth, true);
        expect(c02.linkedSouth, true);

        expect(c12.linked(c02), true);
        expect(c02.linked(c12), true);
      });

      test('indicate that cell 2x2 connected to 1x2 and 2x2', () {
        expect(c22.linkedNorth, true);
        expect(c22.linked(c12), true);
        expect(c12.linked(c22), true);
      });

      test('indicate that cell 1x2 connected to 1x1 to the west', () {
        expect(c12.linkedWest, true);
        expect(c11.linkedEast, true);

        expect(c12.linked(c11), true);
        expect(c11.linked(c12), true);

        expect(c12.west, c11);
        expect(c11.east, c12);
      });

      test('indicate that cell 2x2 is connected to 2x1 to the east', () {
        expect(c22.linkedEast, true);
        expect(c23.linkedWest, true);

        expect(c22.linked(c23), true);
        expect(c23.linked(c22), true);

        expect(c22.east, c23);
        expect(c23.west, c22);
      });

      test('indicate that cell 2x2 is not connected to south and west', () {
        expect(c22.linkedSouth, false);
        expect(c22.linkedWest, false);
      });

      test('indicate that cell 1x1 connected to 2x1 to the south', () {
        expect(c11.linkedSouth, true);
        expect(c11.linked(c21), true);
        expect(c11.south, c21);
      });
    });

    group('have neighbours, and corner cells should have two neighbours', () {
      test('top left cell should have two neighbours', () {
        expect(c00.neighbours.length, 2);
      });

      test('top left cell should have neigbours to the east and to south', () {
        expect(c00.hasNorth, false);
        expect(c00.hasSouth, true);
        expect(c00.hasWest, false);
        expect(c00.hasEast, true);

        expect(c00.south, c10);
        expect(c00.east, c01);

      });

      test('bottom left cell should have two neigbours', () {
        expect(c40.neighbours.length, 2);
      });

      test('bottom left corner should have two neighbours to the east and to north', () {
        expect(c40.hasNorth, true);
        expect(c40.hasSouth, false);
        expect(c40.hasWest, false);
        expect(c40.hasEast, true);

        expect(c40.north, c30);
        expect(c40.east, c41);
      });

      test('top right cell should have two neighbours', () {
        expect(c04.neighbours.length, 2);
      });

      test('top right corner should have two neighbours to the west and south', () {
        expect(c04.hasNorth, false);
        expect(c04.hasSouth, true);
        expect(c04.hasWest, true);
        expect(c04.hasEast, false);

        expect(c04.south, c14);
        expect(c04.west, c03);
      });

      test('bottom right cell should have two neighbours', () {
        expect(c44.neighbours.length, 2);
      });

      test('bottom right corner should have two neighbours to the west and north', () {
        expect(c44.hasNorth, true);
        expect(c44.hasSouth, false);
        expect(c44.hasWest, true);
        expect(c44.hasEast, false);

        expect(c44.north, c34);
        expect(c44.west, c43);
      });
    });

    group('not have neighbours on ecorresponding edges', () {
      test('top most cells should not have cells to north', () {
        expect(c00.hasNorth, false);
        expect(c01.hasNorth, false);
        expect(c02.hasNorth, false);
        expect(c03.hasNorth, false);
        expect(c04.hasNorth, false);

        expect(c00.north, null);
        expect(c01.north, null);
        expect(c02.north, null);
        expect(c03.north, null);
        expect(c04.north, null);
      });

      test('bottom most cells should not have cells to south', () {
        expect(c40.hasSouth, false);
        expect(c41.hasSouth, false);
        expect(c42.hasSouth, false);
        expect(c43.hasSouth, false);
        expect(c44.hasSouth, false);

        expect(c40.south, null);
        expect(c41.south, null);
        expect(c42.south, null);
        expect(c43.south, null);
        expect(c44.south, null);
      });

      test('left most cells should not have cells to the west ', () {
        expect(c00.hasWest, false);
        expect(c10.hasWest, false);
        expect(c20.hasWest, false);
        expect(c30.hasWest, false);
        expect(c40.hasWest, false);

        expect(c00.west, null);
        expect(c10.west, null);
        expect(c20.west, null);
        expect(c30.west, null);
        expect(c40.west, null);
      });

      test('right most cells should not have cells to the east', () {
        expect(c04.hasEast, false);
        expect(c14.hasEast, false);
        expect(c24.hasEast, false);
        expect(c34.hasEast, false);
        expect(c44.hasEast, false);

        expect(c04.east, null);
        expect(c14.east, null);
        expect(c24.east, null);
        expect(c34.east, null);
        expect(c44.east, null);
      });
    });
  });
}