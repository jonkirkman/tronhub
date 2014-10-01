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

  Arena(this.width, this.height);

  bool containsCoordinate(Coordinate c) => c.x >= 0 && c.x < width && c.y >= 0 && c.y < height;

}
