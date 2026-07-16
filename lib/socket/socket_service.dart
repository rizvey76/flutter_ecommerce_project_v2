import 'package:flutter_application_ecom/api/api_client_rev.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  static IO.Socket? _socket;
  // static IO.Socket get socket => _socket!;

  static IO.Socket get socket {
    if (_socket == null) {
      throw Exception("Socket not connected");
    }
    return _socket!;
  }

//store joined conversations
static final Set<String> _joinedRooms = {};

  static Future<void> connect() async {
    final token = await ApiClientRev.getAccessToken();

// duplicate connection prevent
    if(_socket != null && _socket!.connected){
      return;
    }

    //dispose old socket
    _socket?.dispose();

    _socket = IO.io(
      ApiClientRev.baseUrl,
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .setAuth({
            "token": token
          })
          .enableReconnection()
          .setReconnectionAttempts(5)
          .disableAutoConnect()
          .build(),
    );

    _socket!.connect();

    _socket!.onConnect(
      (_) {
        print("Socket connected: ${_socket!.id}");
        ///rejoin previous rooms after reconnect
        for(final room in _joinedRooms){
          emit("join_conversation", room);
        }
      }
    );

    _socket!.onDisconnect(
      (_){
      print("Socket disconnected");
      }
    );

    _socket!.onConnectError(
      (err){
        print("Socket error: $err");
      }
    );

    _socket!.onError(
      (err){
        print("Socket auth error: $err");
      }
    );


  }

  //central emit function
  static void emit(String event, dynamic data){
    socket.emit(event, data);
  }

  ///join room + store it
  static void joinConversation(String conversationId){
    _joinedRooms.add(conversationId);
    emit("join_conversation", conversationId);
  }

    static void disconnect(){
      _socket?.disconnect();
      _socket?.dispose();
      _socket = null;
      _joinedRooms.clear();
    }
}