part of tron_hub;

/**
 * Battle takes place in an Arena
 *
 * Basically a 2D grid used to keep track of availability of Coordinates.
 * Locations are based in the positive quadrant of a cartesian coordinate
 * plane, therefore position 0,0 is the bottom-left corner of the Arena.
 */
class Arena {
  int width, height;
  Map<String, bool> cells;

  Arena();

  bool containsCoordinate(Coordinate coord) {
    // x is gte 0 and lte width
    // y is gte 0 and lte hight
    return false;
  }


}
