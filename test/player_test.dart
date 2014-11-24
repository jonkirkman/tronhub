import "package:unittest/unittest.dart";
import "package:tron_hub/tron_hub.dart";

main() {
  group('Player', () {
    Player p;

    setUp(() {
//      p = new Player('TesterNick', new Stream());
    });

    test('can set current position', () {

      p.currentPosition = new Coordinate(1,1);
    });
  });
}