import 'dart:async';
import 'dart:convert';

import 'package:property_management_frontend/core/error/exceptions.dart';
import 'package:property_management_frontend/core/shared_data_source/websocket_events.dart';

import 'websocket/websocket_connection_v2.dart';

class WebsocketGateway {
  Map<String, Function(dynamic)> eventToCallback = {};
  Map<String, StreamController<dynamic>> eventToStreamCon = {};
  late WebsocketConnection _websocketConnection;
  bool _authorizationStatus = false;
  bool _connectionStatus = false;
  bool _authenticationStatus = false;

  final StreamController<dynamic> _controller = StreamController();
  late Function onlineCallback;

  WebsocketGateway(String url) {
    _listenToIncomingData();
    _websocketConnection =
        WebsocketConnection(url, _controller, _disconnectionCallback);
    _maintainConnection();
  }

  void _maintainConnection() async {
    bool flag = true;
    while (flag) {
      try {
        _websocketConnection.connect();
        flag = false;
      } on NetworkConnectionException catch (_) {}
    }
    // onlineCallback();
    connectionStatus = true;
  }

  void _listenToIncomingData() {
    _controller.stream.listen((data) {
      String event = data['event'];

      eventToCallback[event] != null ? eventToCallback[event]!(data) : false;
      eventToStreamCon[event]?.add(data);
    });
  }

  void sendDataWithoutAuthorization(
      dynamic data, String event, Function(dynamic) callback) {
    eventToCallback[event] = callback;
    if (_connectionStatus) {
      _websocketConnection.send(data);
    } else {
      eventToCallback[event]!(_statusToEvent());
    }
  }

  void send(dynamic data, String event, Function(dynamic) callback) {
    eventToCallback[event] = callback;
    if (authorizationStatus) {
      _websocketConnection.send(data);
    } else {
      eventToCallback[event]!(_statusToEvent());
    }
  }

  void sendDataWithoutAuthorizationV2(
      dynamic data, String event, StreamController<dynamic> streamCon) {
    eventToStreamCon[event] = streamCon;
    if (_connectionStatus) {
      _websocketConnection.send(data);
    } else {
      eventToStreamCon[event]!.add(_statusToEvent());
    }
  }

  void sendV2(dynamic data, String event, StreamController<dynamic> streamCon) {
    eventToStreamCon[event] = streamCon;
    if (authorizationStatus) {
      _websocketConnection.send(data);
    } else {
      eventToStreamCon[event]!.add(_statusToEvent());
    }
  }

  set authorizationStatus(bool authorizationStatus) {
    _authorizationStatus = authorizationStatus;
    _informObservers();
  }

  set connectionStatus(bool connectionStatus) {
    _connectionStatus = connectionStatus;
    _informObservers();
  }

  set authenticationStatus(bool authenticationStatus) {
    _authenticationStatus = authenticationStatus;
    _informObservers();
  }

  bool get authorizationStatus => _authorizationStatus;
  bool get authenticationStatus => _authenticationStatus;
  bool get connectionStatus => _connectionStatus;

  void _informObservers() {
    // TODO sent multiple times
    for (String event in eventToCallback.keys) {
      eventToCallback[event]!(_statusToEvent());
    }
    for (String event in eventToStreamCon.keys) {
      eventToStreamCon[event]!.add(_statusToEvent());
    }
  }

  void _disconnectionCallback() {
    connectionStatus = false;
    authorizationStatus = false;
    _maintainConnection();
  }

  WebsocketGatewayEvents _statusToEvent() {
    if (_authorizationStatus && _authenticationStatus && _connectionStatus) {
      return WebsocketGatewayEvents.authorized;
    } else if (_authenticationStatus && _connectionStatus) {
      return WebsocketGatewayEvents.authenticated;
    } else if (_connectionStatus) {
      return WebsocketGatewayEvents.online;
    } else {
      return WebsocketGatewayEvents.offline;
    }
  }
}
