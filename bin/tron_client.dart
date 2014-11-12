import 'dart:io';
import 'dart:convert';

main() {
  var websocket = WebSocket.connect('ws://127.0.0.1:4040/ws').then(setupEvents);
}

void setupEvents(WebSocket ws) {

  ws.add('Hello, World!');
  ws.listen((msg){ print(msg); });

  stdin.lineMode = true;
  stdin
    .transform(new Utf8Decoder())
    .listen((String text)=> ws.add(text));
}
