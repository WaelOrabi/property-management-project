import 'package:dartz/dartz.dart';
import 'package:project_111/core/error/failures.dart';
import 'package:project_111/features/properties/domain/entities/property.dart';
import 'package:project_111/features/properties/domain/repositories/properties_repositories.dart';

class SearchPropertyUsCases {
  final PropertiesRepositories repositories;
  SearchPropertyUsCases(this.repositories);
  Future<Either<Failure, List<Property>>> call(Property property) async {
    return await repositories.searchProperty(property);
  }
}
