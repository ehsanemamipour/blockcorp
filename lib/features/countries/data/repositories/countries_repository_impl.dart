import 'package:blockcorp/core/utils/network_utils.dart';
import 'package:blockcorp/core/utils/repository_utils.dart';
import 'package:blockcorp/features/countries/data/datasource/countries_remote_datasource.dart';
import 'package:blockcorp/features/countries/domain/entities/countries.dart';
import 'package:blockcorp/core/errors/errors.dart';
import 'package:blockcorp/features/countries/domain/repositories/countries_repository.dart';
import 'package:dartz/dartz.dart';

class CountriesRepositoryImpl extends CountriesRepository {
  CountriesRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});
  final CountriesRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  @override
  Future<Either<Failure, List<Countries>>> fetchCountries() async {
    return requestToServer(true, () => remoteDataSource.fetchCountries());
  }
}
