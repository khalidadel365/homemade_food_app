import 'package:web_socket_channel/web_socket_channel.dart';

class OrdersSocketService {
  WebSocketChannel? _channel;

  void connect(String url) {
    print("Connecting to WebSocket: $url");
    _channel = WebSocketChannel.connect(Uri.parse(url));

    _channel!.ready.then((_) {
      print("✅ WebSocket Connection Established Successfully!");
    }).catchError((error) {
      print("❌ WebSocket Connection Error: $error");
    });
  }

  Stream get stream => _channel?.stream ?? const Stream.empty();

  void close() {
    print("Closing WebSocket...");
    _channel?.sink.close();
    _channel = null;
  }
}