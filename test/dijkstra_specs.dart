part of labyrinth.test;

void dijkstraSpecs() {
  group('Djikstra should', () {
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

    group('Distances class that helps calculate distance from root and should', () {
      Distances d00, d34;

      setUp(() {
        d00 = new Distances(c00);
        d34 = new Distances(c34);
      });

      test('have 0 as a distance to root element', () {
        expect(d00[c00], 0);
        expect(d34[c34], 0);
      });

      group('have convinience methods to access cells', () {
        setUp(() {
          d00[c01] = 1;
          d00[c10] = 1;
          d00[c20] = 2;
        });

        test('to read distance by cell', () {
          expect(d00[c10], 1);
          expect(d00[c01], 1);
          expect(d00[c20], 2);
        });

        test('to write cell and distance', () {
          d00[c02] = 2;
          expect(d00[c02], 2);
        });

        test('return null if cell not added', () {
          expect(d00[c44], -1);
        });
      });
    });
  });
}




