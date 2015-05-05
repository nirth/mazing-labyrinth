part of labyrinth;

class Distances {
  Distances(Cell root) {
    this.root = root;
    _cells = new HashMap<Cell, int>();
    _cells[root] = 0;
  }

  int operator [](Cell cell) => _cells.containsKey(cell) ? _cells[cell] : -1;
  operator []=(Cell cell, int distance) => _cells[cell] = distance;

  HashMap<Cell, int> _cells;

  Cell _root;
  Cell get root => _root;
  set root(Cell value) => _root = value;

  List<Cell> get cells => _cells.keys.toList();

  MaxDistance get maxDistance {
    int maxDistance = 0;
    Cell maxCell = _root;

    _cells.forEach((Cell cell, int distance) {
      if (distance > maxDistance) {
        maxCell = cell;
        maxDistance = distance;
      }
    });

    return new MaxDistance(maxCell, maxDistance);
  }

  Distances pathTo(Cell goal) {
    Cell current = goal;
    Distances breadcrumbs = new Distances(_root);
    breadcrumbs[current] = _cells[current];

    while (current != _root) {
      current.links.forEach((Cell linkedCell) {
        if (_cells[linkedCell] < _cells[current]) {
          breadcrumbs[linkedCell] = _cells[linkedCell];
          current = linkedCell;
        }
      });

    }
    return breadcrumbs;
  }
}

class MaxDistance {
  Cell cell;
  int distance;

  MaxDistance(this.cell, this.distance);
}