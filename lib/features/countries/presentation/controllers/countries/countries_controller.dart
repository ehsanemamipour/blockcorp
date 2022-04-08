import 'package:blockcorp/core/utils/usecase_utils.dart';
import 'package:blockcorp/features/countries/domain/entities/countries.dart';
import 'package:blockcorp/features/countries/domain/usecases/fetch_countries.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CountriesController extends GetxController {
  CountriesController(this._fetchCountries);
  final FetchCountries _fetchCountries;
  List<Countries> countriesList = [];
  List<Countries> selectesCountriesList = [];

  bool isLoading = true;
  String? error;
  fetchData() async {
    final result = await _fetchCountries(NoParams());
    result.fold((l) {
      isLoading = true;
      error = l.message;
    }, (r) {
      countriesList = r;
      isLoading = false;
    });
    update();
  }

  addCountry(Countries countries) {
    selectesCountriesList.add(countries);
    update();
  }

  removeCountry(Countries countries) {
    selectesCountriesList.remove(countries);
    update();
  }
}
