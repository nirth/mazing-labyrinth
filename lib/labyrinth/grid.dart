part of labyrinth;

class Grid extends IterableBase<Cell> {
  Random _random;
  List<List<Cell>> _grid;

  Grid(int this._numRows, int this._numColumns) {
    _random = new Random();

    _grid = createGrid(numRows, numColumns);
    configureCells(_grid);
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

  Cell get randomCell => cellAt(_random.nextInt(numRows - 1), _random.nextInt(numColumns - 1));
  int get size => numRows * numColumns;
  int _numRows;
  int get numRows => _numRows;
  set numRows(int value) => _numRows = value;

  int _numColumns;
  int get numColumns => _numColumns;
  set numColumns(int value) => _numColumns = value;


  Iterator<Cell> get iterator => new GridIterator(this);
}

class GridIterator extends Iterator<Cell> {
  Grid grid;
  int row;
  int column;

  GridIterator(Grid this.grid) {
    row = 0;
    column = 0;
  }

  bool moveNext() {
    _current = grid.cellAt(row, column);
    bool result = _current != null;

    column += 1;

    if (column >= grid.columns) {
      column = 0;
      row += 1;
    }

    return result;
  }

  Cell _current;
  Cell get current => _current;
class RowIterator extends Iterator<List<Cell>> {
  Grid grid;
  int row;

  RowIterator(Grid this.grid) {
    row = 0;
  }

  bool moveNext() {
    if (row < grid.numRows) {
      _current = grid._grid[row];
    } else {
      _current = null;
    }

    row += 1;

    return _current != null;
  }

  List<Cell> _current;
  List<Cell> get current => _current;
}