part of labyrinth.test;

void dijkstraSpecs() {
  group('Djikstra should', () {
    Grid g;
    Cell g00, g01, g02, g03, g04,
         g10, g11, g12, g13, g14,
         g20, g21, g22, g23, g24,
         g30, g31, g32, g33, g34,
         g40, g41, g42, g43, g44;

    setUp(() {
      g = new Grid(5, 5);

      g00 = g.cellAt(0, 0); g01 = g.cellAt(0, 1); g02 = g.cellAt(0, 2); g03 = g.cellAt(0, 3); g04 = g.cellAt(0, 4);
      g10 = g.cellAt(1, 0); g11 = g.cellAt(1, 1); g12 = g.cellAt(1, 2); g13 = g.cellAt(1, 3); g14 = g.cellAt(1, 4);
      g20 = g.cellAt(2, 0); g21 = g.cellAt(2, 1); g22 = g.cellAt(2, 2); g23 = g.cellAt(2, 3); g24 = g.cellAt(2, 4);
      g30 = g.cellAt(3, 0); g31 = g.cellAt(3, 1); g32 = g.cellAt(3, 2); g33 = g.cellAt(3, 3); g34 = g.cellAt(3, 4);
      g40 = g.cellAt(4, 0); g41 = g.cellAt(4, 1); g42 = g.cellAt(4, 2); g43 = g.cellAt(4, 3); g44 = g.cellAt(4, 4);
    });

    group('Dijkstra should', () {
      Grid sg;
      Cell s00, s01, s02,
           s10, s11, s12,
           s20, s21, s22;
      Dijkstra d;
      Distances d00, d11;

      setUp(() {
        sg = new Grid(3, 3);
        s00 = sg.cellAt(0, 0); s01 = sg.cellAt(0, 1); s02 = sg.cellAt(0, 2);
        s10 = sg.cellAt(1, 0); s11 = sg.cellAt(1, 1); s12 = sg.cellAt(1, 2);
        s20 = sg.cellAt(2, 0); s21 = sg.cellAt(2, 1); s22 = sg.cellAt(2, 2);
        d = new Dijkstra();

        // Draw a maze in following shape:
        /*
          * s: Start
          * f: Finish
          * d: Dead end

          +-----------+
          | s | 5   f | 0
          +   +   +---+
          | 1 | 4 | d | 1
          +   +   +   +
          | 2   3   4 | 2
          +-----------+
            0   1   2
        */

        s00.linkSouth();
        s10.linkSouth();
        s20.linkEast();
        s21.linkEast();
        s21.linkNorth();
        s22.linkNorth();
        s11.linkNorth();
        s01.linkEast();
      });

      test('sanity check, make sure test setup is correct', () {
        // Dead end
        expect(s12.linkedSouth, true);
        expect(s22.linkedWest, true);
        // Path
        expect(s02.linkedWest, true);
        expect(s01.linkedSouth, true);
        expect(s11.linkedSouth, true);
        expect(s21.linkedWest, true);
        expect(s20.linkedNorth, true);
        expect(s10.linkedNorth, true);
      });

      test('be able to fill maze with distances from top corner cell.', () {
        d00 = d.distances(s00);

        expect(d00[s00], 0);
        expect(d00[s10], 1);
        expect(d00[s20], 2);
        expect(d00[s21], 3);
        expect(d00[s22], 4);
        expect(d00[s12], 5);
        expect(d00[s11], 4);
        expect(d00[s01], 5);
        expect(d00[s02], 6);
      });

      test('be able to fill maze with disances from center cell', () {
        /*
          * s: Start

          +-----------+
          | 4 | 1   2 | 0
          +   +   +---+
          | 3 | s | 3 | 1
          +   +   +   +
          | 2   1   2 | 2
          +-----------+
            0   1   2
         */
        d11 = d.distances(s11);

        expect(d11[s11], 0);
        expect(d11[s01], 1);
        expect(d11[s02], 2);

        expect(d11[s21], 1);
        expect(d11[s22], 2);
        expect(d11[s12], 3);

        expect(d11[s21], 1);
        expect(d11[s20], 2);
        expect(d11[s10], 3);
        expect(d11[s00], 4);
      });
    });

    group('Distances class that helps calculate distance from root and should', () {
      Distances d00, d34;

      setUp(() {
        d00 = new Distances(g00);
        d34 = new Distances(g34);
      });

      test('have 0 as a distance to root element', () {
        expect(d00[g00], 0);
        expect(d34[g34], 0);
      });

      group('have convinience methods to access cells', () {
        setUp(() {
          d00[g01] = 1;
          d00[g10] = 1;
          d00[g20] = 2;
        });

        test('to read distance by cell', () {
          expect(d00[g10], 1);
          expect(d00[g01], 1);
          expect(d00[g20], 2);
        });

        test('to write cell and distance', () {
          d00[g02] = 2;
          expect(d00[g02], 2);
        });

        test('return null if cell not added', () {
          expect(d00[g44], -1);
        });
      });
    });
  });
}




