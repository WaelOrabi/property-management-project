import 'package:project_111/core/error/exceptions.dart';
import 'package:project_111/core/network/network_info.dart';
import 'package:project_111/features/properties/data/data_sources/property_local_data_sources.dart';
import 'package:project_111/features/properties/data/data_sources/property_remote_data_sources.dart';
import 'package:project_111/features/properties/data/models/property_model.dart';
import 'package:project_111/features/properties/domain/entities/property.dart';
import 'package:project_111/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:project_111/features/properties/domain/repositories/properties_repositories.dart';

typedef ThisFunction = Future<Unit> Function() ;

class PropertyRepositoriesImpl implements PropertiesRepositories {
  final PropertyLocalDataSources propertyLocalDataSources;
  final PropertyRemoteDataSources propertyRemoteDataSources;
  final NetworkInfo networkInfo;

  PropertyRepositoriesImpl({
    required this.propertyLocalDataSources,
    required this.propertyRemoteDataSources,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Unit>> addFavorite(int propertyId)async {
      return await _getFunction(
        () => propertyRemoteDataSources.addFavorite(propertyId));
  }


  @override
  Future<Either<Failure, Unit>> deleteFavorite(int propertyId)async {
    return await _getFunction(
        () => propertyRemoteDataSources.deleteFavorite(propertyId));
  }

   @override
  Future<Either<Failure, Unit>> deleteProperty(int propertyId)async {
      return await _getFunction(
        () => propertyRemoteDataSources.deleteProperty(propertyId));
  }

  @override
  Future<Either<Failure, Unit>> addProperty(Property property) async {
    final PropertyModel propertyModel = PropertyModel(
        propertyId: property.propertyId,
        address: property.address,
        space: property.space,
        baths: property.baths,
        bedRooms: property.bedRooms,
        storeys: property.storeys,
        dateAdded: property.dateAdded,
        description: property.description,
        price: property.price,
        image: property.image,
        category: property.category);
    return await _getFunction(
        () => propertyRemoteDataSources.addProperty(propertyModel));
  }


   @override
  Future<Either<Failure, Unit>> updatProperty(Property property)async {
    final PropertyModel propertyModel = PropertyModel(
        propertyId: property.propertyId,
        address: property.address,
        space: property.space,
        baths: property.baths,
        bedRooms: property.bedRooms,
        storeys: property.storeys,
        dateAdded: property.dateAdded,
        description: property.description,
        price: property.price,
        image: property.image,
        category: property.category);
      return await _getFunction(
        () => propertyRemoteDataSources.updatProperty(propertyModel));
  }


  @override
  Future<Either<Failure, Property>> detailsProperty(int propertyId) async {
    //*********************************************************************************************** */
      try {
        final remoteProperties =
            await propertyRemoteDataSources.detailsProperty(propertyId);
        return Right(remoteProperties);
      } on ServerException {
        return Left(ServerFailure());
      }
    
  }

  @override
  Future<Either<Failure, List<Property>>> getAllProperties() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProperties =
            await propertyRemoteDataSources.getAllProperties();
        propertyLocalDataSources.cacheAllProperties(remoteProperties);
        return Right(remoteProperties);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localProperties =
            await propertyLocalDataSources.getCachedAllProperties();
        return Right(localProperties);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Property>>> getMyFavoriteProperties()async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProperties =
            await propertyRemoteDataSources.getMyFavoriteProperties();
        propertyLocalDataSources.cacheMyFavoriteProperties(remoteProperties);
        return Right(remoteProperties);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localProperties =
            await propertyLocalDataSources.getCachedMyFavoriteProperties();
        return Right(localProperties);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Property>>> getMyListingProperties()async {
   if (await networkInfo.isConnected) {
      try {
        final remoteProperties =
            await propertyRemoteDataSources.getMyListingProperties();
        propertyLocalDataSources.cacheMyListingProperties(remoteProperties);
        return Right(remoteProperties);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localProperties =
            await propertyLocalDataSources.getCachedMyListingProperties();
        return Right(localProperties);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Property>>> searchProperty(Property property)async {
  //*************************************************تاكد منوو**************************************** */
    final PropertyModel propertyModel = PropertyModel(
        propertyId: property.propertyId,
        address: property.address,
        space: property.space,
        baths: property.baths,
        bedRooms: property.bedRooms,
        storeys: property.storeys,
        dateAdded: property.dateAdded,
        description: property.description,
        price: property.price,
        image: property.image,
        category: property.category);

 if (await networkInfo.isConnected) {
      try {
        final remoteProperties =
            await propertyRemoteDataSources.searchProperty(propertyModel);
        propertyLocalDataSources.cacheAllProperties(remoteProperties);
        return Right(remoteProperties);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localProperties =
            await propertyLocalDataSources.getCachedAllProperties();
        return Right(localProperties);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }


  Future<Either<Failure, Unit>> _getFunction(
      ThisFunction thisFunction) async {
    if (await networkInfo.isConnected) {
      try {
        await thisFunction;
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
