part of labyrinth;

class Cells extends IterableBase<Cell> {
  Grid grid;

  Cells(Grid this.grid) {

  }

  Iterator<Cell> get iterator => new CellIterator(grid);
}

class Rows extends IterableBase<List<Cell>> {
  Grid grid;

  Rows(Grid this.grid) {

  }

  Iterator<List<Cell>> get iterator => new RowIterator(grid);
}

class CellIterator extends Iterator<Cell> {
  Grid grid;
  int row;
  int column;

  CellIterator(Grid this.grid) {
    row = 0;
    column = 0;
  }

  bool moveNext() {
    _current = grid.cellAt(row, column);
    bool result = _current != null;

    column += 1;

    if (column >= grid.numColumns) {
      column = 0;
      row += 1;
    }

    return result;
  }

  Cell _current;
  Cell get current => _current;
}

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