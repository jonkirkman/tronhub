import 'dart:io';
import 'dart:async';
import "package:tron_hub/tron_hub.dart" as Tron;

main() {
  runZoned(() {
    HttpServer.bind('127.0.0.1', 4040).then((server) {

      // just a list of websockets
      var sockets = <WebSocket>[];
      var games = <Tron.Game>[];

      server.listen((HttpRequest req) {
        if (req.uri.path == '/ws') {
          // Upgrade a HttpRequest to a WebSocket connection.
          WebSocketTransformer.upgrade(req).then((ws) {
            // add this websocket to our list
            sockets.add(ws);
            // give 'em a name
            var name = 'Player #${sockets.indexOf(ws) + 1}';
            // attach a listener to the websocket
            ws.listen( (msg){
              var blah = MessageParser.deserialize(msg);

              switch(blah['command']) {
                case 'info':
                  print("${games.length} games and ${sockets.length} players");
                  ws.add("${games.length} games and ${sockets.length} players");
                  break;
                case 'name':
                  var oldName = name;
                  name = msg.substring(5).trim();
                  print("$oldName would like to be called $name");
                  ws.add("Okay, $name");
                  break;
                case 'join':
                  print("join or create game ${blah['argument']}");
                  ws.add("join or create game ${blah['argument']}");
                  break;
                case 'ready':
                  print("$name is ready");
                  ws.add("oh good");
                  break;
                default:
                  print("unsupported: $blah");
                  ws.add("unsupported: $blah");
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
