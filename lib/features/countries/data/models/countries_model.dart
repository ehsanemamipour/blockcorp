import 'package:blockcorp/features/countries/domain/entities/countries.dart';

class CountriesModel extends Countries {
  const CountriesModel(
      {String? commonName, String? officialName, required bool isSelected})
      : super(
            commonName: commonName,
            officialName: officialName,
            isSelected: isSelected);
  factory CountriesModel.fromJSON(Map<String, dynamic> mapJSON) {
    return CountriesModel(
      commonName: mapJSON['common'],
      officialName: mapJSON['official'],
      isSelected: false,
    );
  }
}
