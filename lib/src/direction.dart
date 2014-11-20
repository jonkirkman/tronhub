part of tronhub;
/**
 * Direction Enum
 * Stack Overflow responses to enum questions led me to
 * believe that enums have significant bugs currently and
 * that I should build enums this way.
 */
class Direction {
  final _value;
  const Direction._internal(this._value);
  toString() => 'Direction.$_value';

  static const NORTH = const Direction._internal('NORTH');
  static const SOUTH = const Direction._internal('SOUTH');
  static const EAST = const Direction._internal('EAST');
  static const WEST = const Direction._internal('WEST');
}