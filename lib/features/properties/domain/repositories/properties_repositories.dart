import 'package:dartz/dartz.dart';
import 'package:project_111/core/error/failures.dart';
import 'package:project_111/features/properties/domain/entities/property.dart';

abstract class PropertiesRepositories {
  Future<Either<Failure, List<Property>>> getAllProperties();
  Future<Either<Failure, List<Property>>> getMyFavoriteProperties();
  Future<Either<Failure, List<Property>>> getMyListingProperties();
  Future<Either<Failure, Unit>> updatProperty(Property property);
  Future<Either<Failure, Unit>> addProperty(Property property);
  Future<Either<Failure, Unit>> addFavorite(int propertyId);
  Future<Either<Failure, Unit>> deleteProperty(int propertyId);
  Future<Either<Failure, Unit>> deleteFavorite(int propertyId);
  Future<Either<Failure, Property>> detailsProperty(int propertyId);
  Future<Either<Failure, List<Property>>> searchProperty(Property property);
}
