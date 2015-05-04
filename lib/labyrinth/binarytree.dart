part of labyrinth;

class BinaryTree {
  static final logger = LoggerFactory.getLoggerFor(BinaryTree);

  static Grid start(Grid grid) {
    Random random = new Random();
    grid.cells.forEach((Cell cell) {
      List<Cell> neighbours = new List<Cell>();

      if (cell.north != null) {
        neighbours.add(cell.north);
      }

      if (cell.east != null) {
        neighbours.add(cell.east);
      }

      int l = neighbours.length;
      if (l != 0) {
        int i = l == 0 ? 0 : random.nextInt(neighbours.length);
        Cell n = neighbours[i];
        cell.link(n);
      }
    });

    return grid;
  }
}