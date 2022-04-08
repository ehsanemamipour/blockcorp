import 'package:blockcorp/core/consts/consts.dart';
import 'package:blockcorp/core/errors/exceptions.dart';
import 'package:blockcorp/core/services/http_service.dart';
import 'package:blockcorp/features/countries/data/models/countries_model.dart';
import 'package:dio/dio.dart';

abstract class CountriesRemoteDataSource {
  Future<List<CountriesModel>> fetchCountries();
}

class CountriesRemoteDataSourceImpl extends CountriesRemoteDataSource {
  CountriesRemoteDataSourceImpl({required this.httpService});
  final HTTPService httpService;
  @override
  Future<List<CountriesModel>> fetchCountries() async {
    List<CountriesModel> countries = [];
    try {
      final result = await httpService.getData(ServerPaths.countris);
      result.data.forEach((dynamic element) {
        countries.add(CountriesModel.fromJSON(element['name']));
      });
      return countries;
    } on DioError catch (e) {
      throw ServerException(message: e.message);
    }
  }
}
