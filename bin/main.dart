import "dart:io";
import "package:tron_hub/tron_hub.dart" as Tron;

main() {
    // start a webserver
    // (laterz) maybe use game/[somegame] to allow peeps to create and join the same game
    // listen for websocket connections
    // convert websocket clients to players!
    // when do we start the game?
  var myArena = new Tron.Arena(200,200);
  var players = [
      new Tron.Player("JonBot")
    ];

  new Tron.Game(myArena, players);
}
