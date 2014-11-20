part of tron_hub;

// Who will battle?
class Player {
  String name, _initialBearing;
  bool active;
  Stream connection;
  Queue<Coordinate> positions;

  Player(this.name, this.connection);

  Coordinate get currentPosition => positions.first;
             set currentPosition(Coordinate pos) => positions.addFirst(pos);

  Coordinate get previousPosition => positions.elementAt(1);

  Direction get bearing {
    if (currentPosition.x == previousPosition.x) {
      return (currentPosition.y > previousPosition.y)? Direction.NORTH : Direction.SOUTH;
    }
    else if (currentPosition.y == previousPosition.y) {
      return (currentPosition.x > previousPosition.x)? Direction.EAST : Direction.WEST;
    }
    return _initialBearing;
  }
}
