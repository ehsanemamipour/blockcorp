import 'package:blockcorp/features/countries/domain/entities/countries.dart';

class CountriesModel extends Countries {
  const CountriesModel(
      {required String commonName, required String officialName})
      : super(commonName: commonName, officialName: officialName);
  factory CountriesModel.fromJSON(Map<String, dynamic> mapJSON) {
    return CountriesModel(
      commonName: mapJSON['common'],
      officialName: mapJSON['common'],
    );
  }
}
