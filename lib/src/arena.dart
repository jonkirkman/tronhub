part of tron_hub;

/**
 * Battle takes place in an Arena
 *
 * Basically a 2D grid used to keep track of availability of Coordinates.
 */
class Arena {
  int width, height;
  Map<String, bool> cells;

  Arena();
}
