part of labyrinth;

class Png extends Renderer<Image> {
  Png({cellSize: 100}) {
    _cellSize = cellSize;
  }

  int _cellSize;
  int get cellSize => _cellSize;
  set cellSize(int value) => _cellSize = value;

  Image render(Grid grid) {
    int w = grid.numColumns * cellSize;
    int h = grid.numRows * cellSize;

    Image result = new Image(w, h);
    result.fill(0xFFFFFFFF);

    grid.cells.forEach((Cell cell) {
      Image c = renderCell(cell);
      copyInto(result, c, dstX: cell.column * cellSize, dstY: cell.row * cellSize);
    });
    return result;
  }

  Image renderCell(Cell cell) {
    int w = 100;
    int h = 100;
    int s = 3;
    int wallColor = 0xFF0000FF;
    int floorColor = 0xAAAAAAFF;

    Image image = new Image(w, h);
    image = image.fill(wallColor);
    fillRect(image, s, s, w - s, h - s, floorColor);

    if (cell.linkedNorth) fillRect(image, s, 0, w - s, s, floorColor);
    if (cell.linkedSouth) fillRect(image, s, h, w - s, h - s, floorColor);

    if (cell.linkedWest) fillRect(image, 0, s, s, h - s, floorColor);
    if (cell.linkedEast) fillRect(image, w, s, w - s, h - s, floorColor);

//    if (cell.linkedNorth) fillRect(image, s, 0, w - s, s, floorColor);
//    if (cell.linkedSouth) fillRect(image, s, h - 5, w - s, h, floorColor);
//    if (cell.linkedWest) fillRect(image, 0, s, s, h - 5, floorColor);
//    if (cell.linkedEast) fillRect(image, w - s, s, w, h - 5, floorColor);

    return image;
  }
}