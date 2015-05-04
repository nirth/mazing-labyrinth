part of labyrinth;

class Ascii extends Renderer<String> {
  String firstLine(Grid grid) => "+${'---+' * grid.numColumns}\n";

  String row(List<Cell> r) {
    String result = '';

    String top = "${r.map(cellTop).join('')}\n";
    String bottom = "${r.map(cellBottom).join('')}\n";

    result += "|${top}";
    result += "+${bottom}";

    return result;
  }

  String cellTop(Cell c) {
    if (c == null) {
      c = new Cell(-1, -1);
    }

    String body = '   ';
    String eastBoundary = c.linked(c.east) ? ' ' : '|';
    return "${body}${eastBoundary}";
  }

  String cellBottom(Cell c) {
    String southBoundary = c.linked(c.south) ? '   ' : '---';
    return "${southBoundary}+";
  }

  String render(Grid grid) => firstLine(grid) + grid.rows.map(row).join('');
}