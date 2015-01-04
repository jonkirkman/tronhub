import 'dart:io';
import 'dart:async';
import "package:tron_hub/tron_hub.dart" as Tron;

List <WebSocket> sockets = [];
Map <String, Tron.Game> games = {};

void joinOrCreateGame(String gameName, Tron.Player player) {
  if (games.containsKey(gameName)) {
    games[gameName].players.add(player);

    player.connection.add("Joined $gameName");
    print("Joined $gameName");
  }
  else {
    games[gameName] = new Tron.Game(gameName, new Set.from([player]));

    player.connection.add("Created $gameName");
    print("Created $gameName");
  }
}

String gameInfo() {
  var sb = new StringBuffer();

  sb.writeln("${games.length} games and ${sockets.length} players");
  sb.writeln(new List.filled(sb.length, "=").join());

  games.forEach((name, game) {
    sb.writeln("  $name");
    sb.writeln("  " + new List.filled(name.length, "-").join());

    game.players.forEach((player) {
      sb.writeln("    ┣ ${player.name} [${player.state}]}");
    });
  });

  return sb.toString();
}

main() {
  runZoned(() {
    HttpServer.bind('127.0.0.1', 4040).then((server) {

      server.listen((HttpRequest req) {
        if (req.uri.path == '/ws') {
          // Upgrade a HttpRequest to a WebSocket connection.
          WebSocketTransformer.upgrade(req).then((ws) {
            // add this websocket to our list
            sockets.add(ws);

            // give 'em a name
            var player = new Tron.Player('Player #${sockets.indexOf(ws) + 1}', ws);

            // attach a listener to the websocket
            ws.listen( (msg){
              var m = MessageParser.deserialize(msg);

              switch(m['command']) {

                // system info
                case 'info':
                  var info = gameInfo();
                  print(info);
                  ws.add(info);
                  break;

                // set player name
                case 'name':
                  var oldName = player.name;
                  player.name = msg.substring(5).trim();

                  print("$oldName is now called ${player.name}");
                  ws.add("Okay, ${player.name}");
                  break;

                // join a game
                case 'join':
                  joinOrCreateGame(m['argument'], player);
                  break;

                // notify game that player is ready to play
                case 'ready':
                  player.ready();
                  print("${player.name} is ready");
                  ws.add("oh good");
                  break;

                case 'start':
                  var g = games.values.where( (game) {
                    return true;
//                    return game.players.contains(player);
                  } ).first;
                  g.start();
                  print(g.name);
                  break;

                default:
                  print("unsupported: $m");
                  ws.add("unsupported: $m");
              }

              /*
              // print msg to server console
              print('$name says $msg');
              // distribute the msg to everybody
              sockets.forEach((socket){
                if (socket != ws) {
                  socket.add('overheard ... $name says $msg');
                }
              });
              */
            });
          });
        }
      });
    });
  },

  onError: (e) => print("An error occurred. $e"));
}

// commands:
//  name [new_name]
//  info   
//  join [game_name]
//  ready
//  go [left, right, forward]
 
class MessageParser {
  static String serialize() {
    return "";
  }
  static Map deserialize(String msg) {
    msg = msg.trim();
    var parts = msg.split(' ');

    return {
      "command": parts.first,
      "argument": msg.substring(parts.first.length).trim()
    };
  }
}
