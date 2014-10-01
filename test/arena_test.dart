import "package:unittest/unittest.dart";
import "package:tron_hub/tron_hub.dart";

main() {
  group('Arena', () {
    Arena a;

    setUp(() {
      a = new Arena(123,456);
    });

    test('can report its dimensions', () {
      expect(a.width, equals(123));
      expect(a.height, equals(456));
    });

    test('can determine that it contains a given coordinate', () {
      expect(a.containsCoordinate(new Coordinate(50,50)), isTrue);
      expect(a.containsCoordinate(new Coordinate(100,400)), isTrue);
    });

    test('can determin that it does not contains a given coordinate', () {
      expect(a.containsCoordinate(new Coordinate(123,456)), isFalse);
      expect(a.containsCoordinate(new Coordinate(200,500)), isFalse);
    });
  });
}