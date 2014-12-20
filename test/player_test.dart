import "package:unittest/unittest.dart";
import "package:tron_hub/tron_hub.dart";
import "dart:async";

main() {
  group('Player', () {
    Player p;

    setUp(() {
      var sc = new StreamController();
      p = new Player('TesterNick', sc.stream);
    });

    test('can set current position', () {
      var c = new Coordinate(1,1);
      p.currentPosition = c;

      expect(p.currentPosition, equals(c));
    });

    test('can report previous position', () {
      var c1 = new Coordinate(1,1),
          c2 = new Coordinate(2,1);
      p.currentPosition = c1;
      p.currentPosition = c2;

      expect(p.previousPosition, equals(c1));
    });

    test('can report its bearing', () {
      var c1 = new Coordinate(1,1),
          c2 = new Coordinate(2,1);
      p.currentPosition = c1;
      p.currentPosition = c2;

      expect(p.bearing, equals(Direction.north));
    });
  });
}