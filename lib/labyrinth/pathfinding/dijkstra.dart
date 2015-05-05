part of labyrinth;

class Dijkstra {
  Distances distances(Cell cell) {
    Distances result = new Distances(cell);
    var frontier = [cell];

    while(frontier.length > 0) {
      var newFrontier = [];

      frontier.forEach((Cell frontierCell) {
        frontierCell.links.forEach((Cell linkedCell) {
          if (result[linkedCell] == -1) {
            result[linkedCell] = result[frontierCell] + 1;
            newFrontier.add(linkedCell);
          }
        });
      });
      frontier = newFrontier;
    }

    return result;
  }
}