part of tron_hub;

// Who will battle?
class Player {
  String name;
  Direction _initialBearing;
  bool active;
  Stream connection;
  Queue<Coordinate> positions = new Queue();

  Player(this.name, this.connection);

  Coordinate get currentPosition => positions.first;
             set currentPosition(Coordinate pos) => positions.addFirst(pos);

  Coordinate get previousPosition => positions.elementAt(1);

  Coordinate get projectedPosition => currentPosition.next(bearing);

  Direction get bearing {
    if (currentPosition.x == previousPosition.x) {
      return (currentPosition.y > previousPosition.y)? Direction.north : Direction.south;
    }
    else if (currentPosition.y == previousPosition.y) {
      return (currentPosition.x > previousPosition.x)? Direction.east : Direction.west;
    }
    return _initialBearing;
  }
}
