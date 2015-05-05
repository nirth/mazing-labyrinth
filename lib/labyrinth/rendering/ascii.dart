part of labyrinth;

class Ascii extends Renderer<String> {
  Distances _distances;

  Ascii({distances: null}) {
    _distances = distances;
  }

  String firstLine(Grid grid) => "+${'---+' * grid.numColumns}\n";

  String row(List<Cell> r) {
    String result = '';

    String top = "${r.map(cellTop).join('')}\n";
    String bottom = "${r.map(cellBottom).join('')}\n";

    result += "|${top}";
    result += "+${bottom}";

    return result;
  }

  String cellBody(Cell cell) {
    String result;
    if (_distances == null) {
      result = "${cell.row.toRadixString(32)}x${cell.column.toRadixString(32)}";
    } else {
      if (_distances[cell] == -1) {
        result = '   ';
      } else {
        result = ' ${_distances[cell].toRadixString(36)} ';
      }
    }

    return result;
  }

  String cellTop(Cell c) {
    if (c == null) {
      c = new Cell(-1, -1);
    }

    String body = '${cellBody(c)}';
    String eastBoundary = c.linked(c.east) ? ' ' : '|';
    return "${body}${eastBoundary}";
  }

  String cellBottom(Cell c) {
    String southBoundary = c.linked(c.south) ? '   ' : '---';
    return "${southBoundary}+";
  }

  String render(Grid grid) => firstLine(grid) + grid.rows.map(row).join('');
}