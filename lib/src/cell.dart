part of labyrinth;

class Cell {
  Cell(this._x, this._y);

  int _x;
  int get x => _x;

  int _y;
  int get y => _y;

  String toString() => "Cell x=${_x} y=${_y}";
}