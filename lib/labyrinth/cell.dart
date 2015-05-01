part of labyrinth;

class Cell {
  Map<Cell, bool> _links;

  Cell(this._row, this._column) {

    _links = new HashMap<Cell, bool>();
  }

  int _row;
  int get row => _row;
  set row(int value) => _row = value;

  int _column;
  int get column => _column;
  set column(int value) => _column = value;

  Cell link(Cell cell, {bidirectional: true}) {
    _links[cell] = true;
    if (bidirectional) {
      cell.link(this, bidirectional: false);
    }
    return this;
  }

  Cell unlink(Cell cell, {bidirectional: true}) {
    _links.remove(cell);
    if (bidirectional) {
      cell.unlink(this, bidirectional: false);
    }
    return this;
  }

  void unlinkAll() {
    // links is an iterable, .toSet method makes a copy of said iterable. If we try to run loop on actual iterable
    // this will cause runtime exception: "Concurrent modification during iteration: Instance of '_HashMap<Cell, bool>'."
    links.toSet().forEach((cell) => unlink(cell));
  }

  bool linked(Cell cell) => _links.containsKey(cell);

  Iterable<Cell> get links => _links.keys;

  Set<Cell> get neighbours {
    Set<Cell> result = new Set<Cell>();
    if (north != null) result.add(north);
    if (south != null) result.add(south);
    if (east != null) result.add(east);
    if (west != null) result.add(west);

    return result;
  }

  Cell _north;
  Cell get north => _north;
  set north(Cell value) => _north = value;

  Cell _south;
  Cell get south => _south;
  set south(Cell value) => _south = value;

  Cell _west;
  Cell get west => _west;
  set west(Cell value) => _west = value;

  Cell _east;
  Cell get east => _east;
  set east(Cell value) => _east = value;


  String toString() => "Cell row=${row} column=${column}";
}