import 'dart:async';

import 'package:property_management_frontend/core/shared_data_source/websocket_events.dart';

import '../../../../core/shared_data_source/websocket_gateway.dart';
import '../../domain/repositories/account_repository_reply.dart';
import '../../domain/repositories/account_repository_request.dart';

// TODO add stream controllers to a singleton object to release when collected
class AccountRemoteDataSource {
  WebsocketGateway websocketGateway;
  AccountRemoteDataSource(this.websocketGateway);

  StreamController<dynamic> authenticationStreamController =
      StreamController.broadcast();
  StreamSubscription? subscription;

  Stream<AuthenticationRemoteReplyModel> sendAuthenticationRequest(
      AuthenticationRemoteRequestModel authenticationRemoteRequestModel) {
    websocketGateway.sendDataWithoutAuthorizationV2(
        authenticationRemoteRequestModel,
        authenticationRemoteRequestModel.event,
        authenticationStreamController);

    subscription ??= authenticationStreamController.stream.listen((event) {
      if (event is WebsocketGatewayEvents) {
        switch (event) {
          case WebsocketGatewayEvents.offline:
            break;
          case WebsocketGatewayEvents.online:
            websocketGateway.sendDataWithoutAuthorizationV2(
                authenticationRemoteRequestModel,
                authenticationRemoteRequestModel.event,
                authenticationStreamController);
            break;
          case WebsocketGatewayEvents.authenticated:
            break;
          case WebsocketGatewayEvents.authorized:
            break;
        }
      } else {
        AuthenticationRemoteReplyModel authenticationRemoteReplyModel =
            AuthenticationRemoteReplyModel.fromJson(event);
        if (authenticationRemoteReplyModel.succesful) {
          websocketGateway.authenticationStatus = true;
        } else {}
      }
    });

    return authenticationStreamController.stream
        .where((element) => element is! WebsocketGatewayEvents)
        .map<AuthenticationRemoteReplyModel>((event) {
      return AuthenticationRemoteReplyModel.fromJson(event);
    });
  }

  bool _authorizationBindedToGateway = false;
  StreamController<dynamic> authorizationStreamController =
      StreamController.broadcast();
  Stream<AuthorizationRemoteReplyModel> sendAuthorizationRequest(
      AuthorizationRemoteRequestModel authorizationRemoteRequestModel) {
    if (!_authorizationBindedToGateway) {
      websocketGateway.sendDataWithoutAuthorizationV2(
          authorizationRemoteRequestModel,
          authorizationRemoteRequestModel.event,
          authorizationStreamController);
      authorizationStreamController.stream.listen((event) {
        if (event is WebsocketGatewayEvents) {
          switch (event) {
            case WebsocketGatewayEvents.offline:
              break;
            case WebsocketGatewayEvents.online:
              break;
            case WebsocketGatewayEvents.authenticated:
              websocketGateway.sendDataWithoutAuthorizationV2(
                  authorizationRemoteRequestModel,
                  authorizationRemoteRequestModel.event,
                  authorizationStreamController);
              break;
            case WebsocketGatewayEvents.authorized:
              break;
          }
        } else {
          AuthorizationRemoteReplyModel authorizationRemoteReplyModel =
              AuthorizationRemoteReplyModel.fromJson(event);
          if (authorizationRemoteReplyModel.succesful) {
            websocketGateway.authorizationStatus = true;
          } else {
            websocketGateway.authenticationStatus = false;
          }
        }
      });
      _authorizationBindedToGateway = true;
    }

    return authorizationStreamController.stream
        .skipWhile((element) => element is WebsocketGatewayEvents)
        .map<AuthorizationRemoteReplyModel>((event) {
      return AuthorizationRemoteReplyModel.fromJson(event);
    });
  }
}

class AuthenticationRemoteRequestModel extends AuthenticationRequest {
  String event;
  AuthenticationRemoteRequestModel(this.event, username, password)
      : super(username, password);

  Map<String, dynamic> toJson() {
    return {
      'event': event,
      'username': username,
      'password': password,
    };
  }
}

class AuthorizationRemoteRequestModel extends AuthorizeRequest {
  String event;
  AuthorizationRemoteRequestModel(this.event, token) : super(token);
  Map<String, dynamic> toJson() {
    return {
      'event': event,
      'token': token,
    };
  }
}

class SignUpRemoteRequestModel extends SignUpRequest {
  String event;
  SignUpRemoteRequestModel(this.event, username, password, firstName, lastName)
      : super(username, password, firstName, lastName);
  Map<String, dynamic> toJson() {
    return {
      'event': event,
      'username': username,
      'password': password,
      'firstName': firstName,
      'lastName': lastName
    };
  }
}

class ChangePasswordRemoteRequestModel extends ChangePasswordRequest {
  String event;
  ChangePasswordRemoteRequestModel(this.event, oldPassword, newPassword)
      : super(oldPassword, newPassword);
  Map<String, dynamic> toJson() {
    return {
      'event': event,
      'oldPassword': oldPassword,
      'newPassword': newPassword
    };
  }
}

class AuthenticationRemoteReplyModel extends AuthenticationReply {
  AuthenticationRemoteReplyModel(token, error, successful)
      : super(token, error, successful);
  factory AuthenticationRemoteReplyModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationRemoteReplyModel(
      json['token'] ?? '',
      json['error'] ?? '',
      json['successful'] ?? false,
    );
  }
}

class AuthorizationRemoteReplyModel extends AuthorizationReply {
  AuthorizationRemoteReplyModel(error, successful) : super(error, successful);
  factory AuthorizationRemoteReplyModel.fromJson(Map<String, dynamic> json) {
    return AuthorizationRemoteReplyModel(
      json['error'] ?? '',
      json['successful'] ?? false,
    );
  }
}

class SignUpRemoteReplyModel extends SignUpReply {
  SignUpRemoteReplyModel(error, successful) : super(error, successful);
  factory SignUpRemoteReplyModel.fromJson(Map<String, dynamic> json) {
    return SignUpRemoteReplyModel(
      json['error'] ?? '',
      json['successful'] ?? false,
    );
  }
}

class ChangePasswordRemoteReplyModel extends SignUpReply {
  ChangePasswordRemoteReplyModel(error, successful) : super(error, successful);
  factory ChangePasswordRemoteReplyModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordRemoteReplyModel(
      json['error'] ?? '',
      json['successful'] ?? false,
    );
  }
}
