import 'package:blockcorp/core/utils/usecase_utils.dart';
import 'package:blockcorp/features/countries/domain/usecases/fetch_countries.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CountriesController extends GetxController {
  CountriesController(this._fetchCountries);
  final FetchCountries _fetchCountries;

  fetchData() async {
    final result = await _fetchCountries(NoParams());
    result.fold((l) => print(l), (r) => print(r));
    update();
  }
}
