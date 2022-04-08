import 'package:blockcorp/core/errors/errors.dart';
import 'package:blockcorp/features/countries/domain/entities/countries.dart';
import 'package:dartz/dartz.dart';

abstract class CountriesRepository {
  Future<Either<Failure, List<Countries>>> fetchCountries();
}
