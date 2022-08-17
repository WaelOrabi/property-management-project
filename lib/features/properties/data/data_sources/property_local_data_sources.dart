import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:project_111/core/error/exceptions.dart';
import 'package:project_111/features/properties/data/models/property_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PropertyLocalDataSources {
  Future<List<PropertyModel>> getCachedAllProperties();
  Future<List<PropertyModel>> getCachedMyFavoriteProperties();
  Future<List<PropertyModel>> getCachedMyListingProperties();
  Future<Unit> cacheAllProperties(List<PropertyModel> properyModel);
  Future<Unit> cacheMyFavoriteProperties(List<PropertyModel> properyModel);
  Future<Unit> cacheMyListingProperties(List<PropertyModel> properyModel);
}

class PropertyLocalDataSourcesImpl implements PropertyLocalDataSources {
  final SharedPreferences sharedPreferences;
  PropertyLocalDataSourcesImpl({required this.sharedPreferences});

  @override
  Future<Unit> cacheAllProperties(List<PropertyModel> properyModel) {
    List propertyModelsToJson = properyModel
        .map<Map<String, dynamic>>((propertyModel) => propertyModel.toJson())
        .toList();
    sharedPreferences.setString(
        "CACHED_ALL_PROPERTIES", json.encode(propertyModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<PropertyModel>> getCachedAllProperties() {
    final jsonString = sharedPreferences.getString("CACHED_ALL_PROPERTIES");
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<PropertyModel> jsonToPropertyModels = decodeJsonData
          .map<PropertyModel>(
              (jsonPropertyModel) => PropertyModel.fromJson(jsonPropertyModel))
          .toList();
      return Future.value(jsonToPropertyModels);
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> cacheMyFavoriteProperties(List<PropertyModel> properyModel) {
    List propertyModelsToJson = properyModel
        .map<Map<String, dynamic>>((propertyModel) => propertyModel.toJson())
        .toList();
    sharedPreferences.setString(
        "CACHED_MY_FAVORITE_PROPERTIES", json.encode(propertyModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<Unit> cacheMyListingProperties(List<PropertyModel> properyModel) {
     List propertyModelsToJson = properyModel
        .map<Map<String, dynamic>>((propertyModel) => propertyModel.toJson())
        .toList();
    sharedPreferences.setString(
        "CACHED_MY_LISTING_PROPERTIES", json.encode(propertyModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<PropertyModel>> getCachedMyFavoriteProperties() {
    final jsonString = sharedPreferences.getString("CACHED_MY_FAVORITE_PROPERTIES");
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<PropertyModel> jsonToPropertyModels = decodeJsonData
          .map<PropertyModel>(
              (jsonPropertyModel) => PropertyModel.fromJson(jsonPropertyModel))
          .toList();
      return Future.value(jsonToPropertyModels);
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<List<PropertyModel>> getCachedMyListingProperties() {
   final jsonString = sharedPreferences.getString("CACHED_MY_LISTING_PROPERTIES");
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<PropertyModel> jsonToPropertyModels = decodeJsonData
          .map<PropertyModel>(
              (jsonPropertyModel) => PropertyModel.fromJson(jsonPropertyModel))
          .toList();
      return Future.value(jsonToPropertyModels);
    } else {
      throw EmptyCacheException();
    }
  }
}
