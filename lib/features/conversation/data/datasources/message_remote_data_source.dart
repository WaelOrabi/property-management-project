import 'dart:convert';

import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../models/message_model.dart';
import 'package:http/http.dart' as http;

abstract class MessageRemoteDataSource {
  Future<List<MessageModel>> getMessages();

  Future<Unit> deleteMessage(int messageId);


  Future<Unit> sendMessage(MessageModel messageModel);
}

const BASE_URL = '';

class MessageRemoteDataSourceImpl implements MessageRemoteDataSource {
  final http.Client client;

  MessageRemoteDataSourceImpl({required this.client});

  @override
  Future<Unit> deleteMessage(int messageId) async {
    final response = await client.delete(
        Uri.parse(BASE_URL + "/messages/${messageId.toString()}"),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MessageModel>> getMessages() async {
    final response = await client.get(Uri.parse(BASE_URL),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<MessageModel> messageModels = decodedJson
          .map<MessageModel>(
              (jsonMessageModel) => MessageModel.fromJson(jsonMessageModel))
          .toList();
      return messageModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> sendMessage(MessageModel messageModel) async {
    final body = {
      'senderFullname': messageModel.senderFullname,
      'receiverFullname': messageModel.receiverFullname,
      'dateSent': messageModel.dateSent,
      'message': messageModel.message,
    };
    final response = await client.post(Uri.parse(BASE_URL), body: body);
    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
