import 'package:blockcorp/features/countries/domain/entities/countries.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  List<Countries> countriesList = [];

  addSelectedCountries(List<Countries> countries) {
    countriesList.addAll(countries);
  }
}
