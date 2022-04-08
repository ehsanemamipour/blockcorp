import 'package:blockcorp/features/countries/presentation/pages/countries_list_page.dart';
import 'package:blockcorp/features/countries/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

const String homeRoute = '/';
const String countriesListRoute = '/countriesList';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case countriesListRoute:
        CountriesListPage instance = settings.arguments as CountriesListPage;
        return MaterialPageRoute(
            builder: (_) => CountriesListPage(
                  selectedCountries: instance.selectedCountries,
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
