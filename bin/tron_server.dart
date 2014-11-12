import 'dart:io';
import 'dart:async';

main() {
  runZoned(() {
    HttpServer.bind('127.0.0.1', 4040).then((server) {

      // just a list of websockets
      var sockets = <WebSocket>[];

      server.listen((HttpRequest req) {
        if (req.uri.path == '/ws') {
          // Upgrade a HttpRequest to a WebSocket connection.
          WebSocketTransformer.upgrade(req).then((ws) {
            // add this websocket to our list
            sockets.add(ws);
            // give 'em a name
            var name = 'Player #${sockets.indexOf(ws) + 1}';
            // send a welcome
            ws.add('Hello $name');
            // attach a listener to the websocket
            ws.listen( (msg){
              // remove any trailing whitespace
              msg = msg.trim();

              if (msg.startsWith('name:')) {
                var oldName = name;
                name = msg.substring(5).trim();
                print('$oldName would like to be called $name');
              } else {
                // print msg to server console
                print('$name says $msg');
                // distribute the msg to everybody
                sockets.forEach((socket){
                  if (socket != ws) {
                    socket.add('overheard ... $name says $msg');
                  }
                });
              }
            });
          });
        }
      });
    });
  },
  onError: (e) => print("An error occurred. $e"));
}
