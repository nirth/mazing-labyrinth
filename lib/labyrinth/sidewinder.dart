part of labyrinth;

class Sidewinder {
  static final logger = LoggerFactory.getLoggerFor(Sidewinder);

  static Grid start(Grid grid) {
    Random random = new Random();

    grid.rows.forEach((List<Cell> row) {
      List<Cell> run = new List<Cell>();

      row.forEach((Cell cell) {
        run.add(cell);

        bool atEast = !cell.hasEast;
        bool atNorth = !cell.hasNorth;

        bool shouldCloseOut = atEast || (!atNorth && random.nextInt(2) == 0);

        if (shouldCloseOut) {
          Cell member = run[random.nextInt(run.length)];
          member.linkNorth();
          run.clear();
        } else {
          cell.linkEast();
        }
      });
    });

    return grid;
  }
}