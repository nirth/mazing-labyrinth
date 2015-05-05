part of labyrinth;

class Grid {
  Random _random;
  List<List<Cell>> _grid;

  Grid(int this._numRows, int this._numColumns) {
    _random = new Random();

    _grid = createGrid(numRows, numColumns);
    configureCells(_grid);

    _rows = new Rows(this);
    _cells = new Cells(this);
  }

  List<List<Cell>> createGrid(int rows, int columns) {
    List<List<Cell>> result = new List<List<Cell>>();

    for(int r = 0; r < rows; r += 1) {
      List<Cell> row = new List<Cell>();
      result.add(row);
      for (int c = 0; c < columns; c += 1) {
        row.add(new Cell(r, c));
      }
    }
    return result;;
  }


  /**
   * Configures cells by running through each one and attaches north, south, west and east neighbours to it.
   *
   * @param List<List<Cell>> rows   Representation of a two dimensional grid. List of Lists of Cells.
   */
  void configureCells(List<List<Cell>> rows) {
    rows.forEach((List<Cell> row) {
      row.forEach((Cell cell) {
        int r = cell.row;
        int c = cell.column;

        cell.north = cellAt(r - 1, c);
        cell.south = cellAt(r + 1, c);
        cell.west = cellAt(r, c - 1);
        cell.east = cellAt(r, c + 1);
      });
    });
  }

  Cell cellAt(row, column) {
    if (row < 0 || row >= numRows) {
      return null;
    }
    if (column < 0 || column >= numColumns) {
      return null;
    }
    return _grid[row][column];
  }

  /**
   * Returns random `Cell`.
   */
  Cell get randomCell => cellAt(_random.nextInt(numRows - 1), _random.nextInt(numColumns - 1));

  /**
   * Returns total amount of cells in this grid.
   */
  int get size => numRows * numColumns;


  int _numRows;

  /**
   * Indicates total number of rows in grid.
   */
  int get numRows => _numRows;
  set numRows(int value) => _numRows = value;

  int _numColumns;

  /**
   * Indicates total number of columns in grid.
   */
  int get numColumns => _numColumns;
  set numColumns(int value) => _numColumns = value;

  Cells _cells;

  /**
   * An Iterable collection of all cells.
   */
  Cells get cells => _cells;

  Rows _rows;

  /**
   * An Iterable collection of all rows.
   */
  Rows get rows => _rows;
}