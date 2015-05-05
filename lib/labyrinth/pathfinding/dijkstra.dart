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

  Distances recursiveDistances({Cell cell: null, Distances distances: null, List<Cell> frontier: null}) {
    if (distances == null) {
      distances = new Distances(cell);
    }

    if (frontier == null) {
      frontier = [cell];
    }

    if (frontier.length > 0) {
      return tailDistances();
    } else {
      return distances;
    }
  }

  Distances tailDistances({Distances distances, List<Cell> frontier}) {
    List<Cell> f = []; // New frontier;

    frontier.forEach((Cell frontierCell) {
      frontierCell.links.forEach((Cell linkedCell) {
        if (distances[linkedCell] == -1) {
          distances[linkedCell] = distances[frontierCell] + 1;
          f.add(linkedCell);
        }
      });
    });

    



    return null;
  }
}