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
  });
}