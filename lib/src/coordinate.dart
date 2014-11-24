part of tron_hub;

/**
 * A 2D reference to a location on a cartesian plane
 */
class Coordinate {
  int x = 0, y = 0;

  Coordinate(this.x, this.y);

  /// Creates a new Coordinate from a list such as [12,34]
  Coordinate.fromList(List input) {
    x = input[0];
    y = input[1];
  }

  /// Creates a new Coordinate from a string such as "12,34"
  Coordinate.fromString(String input) {
    var parts = input.split(',');
    x = int.parse(parts[0]);
    y = int.parse(parts[1]);
  }

  /// Using Direction enum simplifies retrieving the next projected coordinate
  Coordinate next(Direction direction) {
    switch (direction) {
      case Direction.NORTH:
        return north;
      case Direction.SOUTH:
        return south;
      case Direction.EAST:
        return east;
      case Direction.WEST:
        return west;
    }
    return this;
  }

  Coordinate get north => new Coordinate(x, y-1);

  Coordinate get south => new Coordinate(x, y+1);

  Coordinate get west => new Coordinate(x-1, y);

  Coordinate get east => new Coordinate(x+1, y);

  bool operator ==(other) => x == other.x && y == other.y;

  String toString() => "$x,$y";
}