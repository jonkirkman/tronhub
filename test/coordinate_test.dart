import "package:unittest/unittest.dart";
import "package:tron_hub/tron_hub.dart";

main() {
  group('Coordinate', () {

    test('can be created', () {
      expect(new Coordinate(123,321));
    });

    test('can be created from a list', () {
      fail('not yet tested');
    });

    test('can be created from a string', () {
      fail('not yet tested');
    });

    test('next method should return correct coordinate', () {
      var c = new Coordinate(1,1);
      /**
       * Wow.  This test actually fixed a bug before it was a problem.
       * The auto incrementer ++ and -- actually changes the property and return the previous value.
       * For example: c.next(North) was actually modifying the y value of c and the coordinate that was returned was 1,1
       * So, c = 1,0 and north = 1,1
       * This deviates from most languages I know. - Nick Nov 24, 2014
      */
      var north = c.next(Direction.NORTH);
      var south = c.next(Direction.SOUTH);
      var east = c.next(Direction.EAST);
      var west = c.next(Direction.WEST);

      expect(north.toString(), '1,0');
      expect(south.toString(), '1,2');
      expect(west.toString(), '0,1');
      expect(east.toString(), '2,1');
    });
  });
}