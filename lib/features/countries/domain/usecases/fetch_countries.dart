import 'package:blockcorp/core/errors/errors.dart';
import 'package:blockcorp/core/utils/usecase_utils.dart';
import 'package:blockcorp/features/countries/domain/entities/countries.dart';
import 'package:blockcorp/features/countries/domain/repositories/countries_repository.dart';
import 'package:dartz/dartz.dart';

class FetchCountries implements UseCase<List<Countries>, NoParams> {
  FetchCountries({required this.repository});
  final CountriesRepository repository;

  @override
  Future<Either<Failure, List<Countries>>> call(params) {
    return repository.fetchCountries();
  }
}
