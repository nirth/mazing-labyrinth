part of labyrinth;

class Cell {
  Cell(this._x, this._y);

  int _x;
  int get x => _x;

  int _y;
  int get y => _y;

  Cell _top;
  Cell get top => _top;
  void set top(Cell value) => _top = value;

  Cell _bottom;
  Cell get bottom => _bottom;
  set bottom(Cell value) => _bottom = value;

  Cell _left;
  Cell get left => _left;
  set left(Cell value) => _left = value;

  Cell _right;
  Cell get right => _right;
  set right(Cell value) => _right = value;

  
  String toString() => "Cell x=${_x} y=${_y}";
}