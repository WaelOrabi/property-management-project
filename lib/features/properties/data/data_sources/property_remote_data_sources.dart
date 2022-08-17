import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:project_111/core/error/exceptions.dart';
import 'package:project_111/features/properties/data/models/property_model.dart';
import 'package:http/http.dart' as http;

abstract class PropertyRemoteDataSources {
  Future<List<PropertyModel>> getAllProperties();
  Future<Unit> addFavorite(int propertyId);
  Future<Unit> addProperty(PropertyModel propertyModel);
  Future<Unit> deleteFavorite(int propertyId);
  Future<Unit> deleteProperty(int propertyId);
  Future<PropertyModel> detailsProperty(int propertyId);
  Future<List<PropertyModel>> getMyFavoriteProperties();
  Future<Unit> updatProperty(PropertyModel propertyModel);
  Future<List<PropertyModel>> getMyListingProperties();
  Future<List<PropertyModel>> searchProperty(PropertyModel propertyModel);
}

const BASE_URL = "****************";

class PropertyRemoteDataSourcesImpl implements PropertyRemoteDataSources {
  final http.Client client;

  PropertyRemoteDataSourcesImpl({required this.client});

  @override
  Future<Unit> addFavorite(int propertyId) {
    // TODO: implement addFavorite
    throw UnimplementedError();
  }

  @override
  Future<Unit> addProperty(PropertyModel propertyModel) async {
    final body = {
      "address": propertyModel.address,
      "baths": propertyModel.baths,
      'bedRooms': propertyModel.bedRooms,
      'category': propertyModel.category,
      'dateAdded': propertyModel.dateAdded,
      'description': propertyModel.description,
      'image': propertyModel.image,
      'price': propertyModel.price,
      'propertyId': propertyModel.propertyId,
      'space': propertyModel.space,
      'storeys': propertyModel.storeys,
    };
    final response =
        await client.post(Uri.parse(BASE_URL + "****"), body: body);
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deleteFavorite(int propertyId) {
    // TODO: implement deleteFavorite
    throw UnimplementedError();
  }

  @override
  Future<Unit> deleteProperty(int propertyId) async {
    final response = await client.delete(
      Uri.parse(BASE_URL + "****"),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PropertyModel> detailsProperty(int propertyId) {
    // TODO: implement detailsProperty
    throw UnimplementedError();
  }

  @override
  Future<List<PropertyModel>> getAllProperties() async {
    final response = await client.get(
      Uri.parse(BASE_URL + "*****"),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;
      final List<PropertyModel> propertyModels = decodeJson
          .map<PropertyModel>(
              (jsonPropertyModle) => PropertyModel.fromJson(jsonPropertyModle))
          .toList();
      return propertyModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<PropertyModel>> getMyFavoriteProperties() {
    // TODO: implement getMyFavoriteProperties
    throw UnimplementedError();
  }

  @override
  Future<List<PropertyModel>> getMyListingProperties() {
    // TODO: implement getMyListingProperties
    throw UnimplementedError();
  }

  @override
  Future<List<PropertyModel>> searchProperty(PropertyModel propertyModel) {
    // TODO: implement searchProperty
    throw UnimplementedError();
  }

  @override
  Future<Unit> updatProperty(PropertyModel propertyModel) async {
    final body = {
      "address": propertyModel.address,
      "baths": propertyModel.baths,
      'bedRooms': propertyModel.bedRooms,
      'category': propertyModel.category,
      'dateAdded': propertyModel.dateAdded,
      'description': propertyModel.description,
      'image': propertyModel.image,
      'price': propertyModel.price,
      'propertyId': propertyModel.propertyId,
      'space': propertyModel.space,
      'storeys': propertyModel.storeys,
    };
    final response =
        await client.post(Uri.parse(BASE_URL + "****"), body: body);
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
