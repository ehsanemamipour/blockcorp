import 'package:blockcorp/core/utils/usecase_utils.dart';
import 'package:blockcorp/features/countries/data/models/countries_model.dart';
import 'package:blockcorp/features/countries/domain/entities/countries.dart';
import 'package:blockcorp/features/countries/domain/usecases/fetch_countries.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CountriesController extends GetxController {
  CountriesController(this._fetchCountries);
  final FetchCountries _fetchCountries;
  List<Countries> countriesList = [];
  List<Countries> searchtList = [];

  bool isLoading = true;
  String? error;

  fetchData(List<Countries> countries) async {
    final result = await _fetchCountries(NoParams());
    result.fold((l) {
      isLoading = true;
      error = l.message;
    }, (r) {
      countriesList = r;
      searchtList = r;
      addSelectedData(countries);
      isLoading = false;
    });
    update();
  }

  addSelectedData(List<Countries> countries) {
    for (Countries i in countries) {
      int index = countriesList.indexOf(i);
      List<CountriesModel> replacement = [
        CountriesModel(
            commonName: i.commonName,
            officialName: i.officialName,
            isSelected: i.isSelected)
      ];
      countriesList.replaceRange(index, index + 1, replacement);
      searchtList.replaceRange(index, index + 1, replacement);
    }
    update();
  }

  searchCountry(String searchedText) {
    searchtList = countriesList
        .where((element) => element.commonName!
            .toLowerCase()
            .contains(searchedText.toLowerCase()))
        .toList();
    update();
  }

  changeSelectedValue(Countries countries) {
    int index = countriesList.indexOf(countries);
    int searchIndex = searchtList.indexOf(countries);
    List<CountriesModel> replacement = [
      CountriesModel(
          commonName: countries.commonName,
          officialName: countries.officialName,
          isSelected: !countries.isSelected)
    ];
    countriesList.replaceRange(index, index + 1, replacement);
    searchtList.replaceRange(searchIndex, searchIndex + 1, replacement);
    update();
  }
}
