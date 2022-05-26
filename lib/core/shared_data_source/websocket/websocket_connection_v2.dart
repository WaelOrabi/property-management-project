import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:property_management_frontend/core/error/exceptions.dart';
import 'package:property_management_frontend/core/shared_data_source/websocket/consumed_msgs.dart';
import 'package:property_management_frontend/core/shared_data_source/websocket/msg_buffer.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/io.dart';

import 'package:web_socket_channel/web_socket_channel.dart';

import 'msg_model.dart';

class WebsocketConnection {
  String url;
  final Uuid _uuid = const Uuid();
  late WebSocketChannel channel;
  StreamController<dynamic> receiver;
  MsgBuffer _msgBuffer = MsgBuffer();
  final Duration _webSocketConnectionTimeout =
      const Duration(milliseconds: 500);
  ConsumedMsgs _consumedMsgs = ConsumedMsgs();
  bool disconnected = true;
  Function disconncetionCallback;
  late StreamSubscription<dynamic> _sub;
  late Timer _timer;
  static const String acknowledged = "acknowledged";
  WebsocketConnection(this.url, this.receiver, this.disconncetionCallback);

  void connect() async {
    try {
      /*
      // works just in ios

      final socket =
          await WebSocket.connect(url).timeout(_webSocketConnectionTimeout);
      channel = IOWebSocketChannel(socket);
      
      */
      // works in google chrome and ios
      channel = WebSocketChannel.connect(Uri.parse(url));
    } on SocketException catch (_) {
      throw NetworkConnectionException();
    } on TimeoutException catch (_) {
      throw NetworkConnectionException();
    } on Exception catch (_) {
      throw NetworkConnectionException();
    }
    _listen();
    _reTransferBuffer();
    disconnected = false;
  }

  void _listen() {
    _sub = channel.stream.listen((msg) {
      MsgModel msgModel = MsgModel.fromJson(json.decode(msg));
      if (msgModel.data == acknowledged) {
        _msgBuffer.deleteCopy(msgModel.id);
      } else if (!_consumedMsgs.isMsgConsumed(msgModel.id)) {
        _consumedMsgs.addConsumedMsg(msgModel.id);
        _acknowledgeMsg(msgModel.id);
        _sendDataToReceiver(msgModel.data);
      } else if (_consumedMsgs.isMsgConsumed(msgModel.id)) {
        _acknowledgeMsg(msgModel.id);
      }
    });
  }

  void _sendDataToReceiver(dynamic data) {
    if (!receiver.isClosed) receiver.sink.add(data);
  }

  void _acknowledgeMsg(String id) {
    _transferMsg(MsgModel(id: id, data: acknowledged));
  }

  void send(dynamic data) {
    if (channel.closeCode == null) {
      MsgModel msgModel = MsgModel(data: data, id: _uuid.v4());
      _msgBuffer.saveCopy(msgModel);
      _transferMsg(msgModel);
    }
  }

  void _transferMsg(MsgModel msgModel) {
    if (channel.closeCode == null) {
      channel.sink.add(json.encode(msgModel.toJson()));
    } else {
      reInitializeResources();
      disconncetionCallback();
    }
  }

  void _reTransferBuffer() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      _timer = timer;
      List<MsgModel> msgs = await _msgBuffer.getBufferContent();
      for (MsgModel msgModel in msgs) {
        _transferMsg(msgModel);
      }
    });
  }

  void reInitializeResources() {
    disconnected = true;
    channel.sink.close();
    _msgBuffer = MsgBuffer();
    _consumedMsgs = ConsumedMsgs();
    _sub.cancel();
    _timer.cancel();
  }
}
