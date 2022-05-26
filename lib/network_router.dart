/* import 'dart:async';

import 'package:chess_project/model/models/chat/chat_manager.dart';
import 'package:chess_project/model/models/friendship/friendship_manager.dart';
import 'package:chess_project/model/models/info/info_manager.dart';

import '../models/source.dart';

import '../models/API/account.dart';

import '../models/game/games_manager.dart';
import 'websocket_data_source/websocket_connection.dart';
import '../../regex.dart';

class NetworkRouter {
  StreamController<dynamic> _websocketController;
  WebSocketConnection _websocket;

  GamesManager _gamesManager;
  Account _account;
  ChatManager _chatManager;
  FriendshipManager _friendshipManager;
  InfoManager _infoManager;
  String _backendUrl;
  NetworkRouter._initialize(String backendUrl) {
    this._backendUrl = backendUrl;
    _websocketController = StreamController<dynamic>.broadcast();
    _websocket = new WebSocketConnection(_backendUrl, _websocketController);

    _listenToServer();
  }

  static NetworkRouter _instance;

  factory NetworkRouter.initialize(String backendUrl) {
    if (_instance == null) _instance = NetworkRouter._initialize(backendUrl);
    return _instance;
  }
  factory NetworkRouter() {
    return _instance;
  }
  void sendMessageToWebsocket(dynamic data) {
    this._websocket.postMessage(data);
  }

  void sendMessageToServer(dynamic data) {
    this._websocket.send(data);
  }

  void _listenToServer() {
    this._websocketController.stream.listen((data) {
      this._routeMsgs(data);
    });
  }

  void _routeMsgs(dynamic info) {
    String directory = Regex().getLeadingDirectoryName(info['directory']);
    info['directory'] = Regex().deleteLeadingDirectory(info['directory']);
    info['source'] = Source.SERVER;
    switch (directory) {
      case 'game':
      case 'games_manager':
      case 'puzzle_manager':
        this._gamesManager.postMessage(info);
        break;
      case 'chat_manager':
        this._chatManager.postMessage(info);
        break;
      case 'friendship':
        this._friendshipManager.postMessage(info);
        break;
      case 'stockfish':
        this._gamesManager.postMessage(info);
        break;
      case 'account':
        this._account.postMessage(info);
        break;
      case 'info_manager':
        this._infoManager.postMessage(info);
        break;
    }
  }

  set account(Account account) {
    this._account = account;
  }

  set gamesManager(GamesManager gamesManager) {
    this._gamesManager = gamesManager;
  }

  set chatManager(ChatManager chatManager) {
    this._chatManager = chatManager;
  }

  set friendshipManager(FriendshipManager friendshipManager) {
    this._friendshipManager = friendshipManager;
  }
  set infoManager(InfoManager infoManager) {
    this._infoManager = infoManager;
  }
}
 */