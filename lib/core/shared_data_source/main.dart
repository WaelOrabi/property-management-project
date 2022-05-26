// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:property_management_frontend/core/shared_data_source/websocket_gateway.dart';
import 'package:property_management_frontend/features/account/data/datasources/account_remote_data_source.dart';

late WebsocketGateway websocketGateway;

void first() async {
  String signUp = File('lib/core/json_data/sign_up.json').readAsStringSync();
  Map<String, dynamic> signUpMap = json.decode(signUp);
  await Future.delayed(
      const Duration(seconds: 1),
      () => {
            websocketGateway.sendDataWithoutAuthorization(signUpMap, 'signUp',
                (dataBack) {
              print(dataBack);
              second();
            })
          });
}

void second() async {
  String signIn = File('lib/core/json_data/sign_in.json').readAsStringSync();
  Map<String, dynamic> signInMap = json.decode(signIn);
  await Future.delayed(
      const Duration(seconds: 1),
      () => {
            websocketGateway.sendDataWithoutAuthorization(signInMap, 'signIn',
                (dataBack) {
              print(dataBack);
              if (dataBack['token'] != null) third(dataBack['token']);
            })
          });
}

void third(String token) async {
  String authorize =
      File('lib/core/json_data/authorization.json').readAsStringSync();
  Map<String, dynamic> authorizeMap = json.decode(authorize);
  await Future.delayed(
      const Duration(seconds: 1),
      () => {
            websocketGateway.sendDataWithoutAuthorization(
                authorizeMap, 'authorize', (dataBack) {
              print(dataBack);
              fourth();
            })
          });
}

void fourth() async {
  String changePassword =
      File('lib/core/json_data/change_password.json').readAsStringSync();
  Map<String, dynamic> changePasswordMap = json.decode(changePassword);
  await Future.delayed(
      const Duration(seconds: 1),
      () => {
            websocketGateway.sendDataWithoutAuthorization(
                changePasswordMap, 'changePassword', (dataBack) {
              print(dataBack);
              second();
            })
          });
}

void fifth() {}

void main() async {
  websocketGateway = WebsocketGateway('ws://localhost:5000/');
  first();
}
