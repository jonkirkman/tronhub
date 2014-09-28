part of tron_hub;

// Who will battle?
class Player {
  String name;
  bool active;
  Queue<Coordinate> positions;

  Player(this.name);

  Coordinate get currentPosition => positions.first;
             set currentPosition(Coordinate pos) => positions.addFirst(pos);

  Coordinate get previousPosition = positions.elementAt(1);

  String get bearing {
    if (currentPosition.x == previousPosition.x) {
      return (currentPosition.y > previousPosition.y)? "UP" : "DOWN";
    }
    else if (currentPosition.y == previousPosition.y) {
      return (currentPosition.x > previousPosition.x)? "LEFT" : "RIGHT";
    }
  }
}
