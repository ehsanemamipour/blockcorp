import 'package:blockcorp/core/router/router.dart';
import 'package:blockcorp/features/countries/domain/entities/countries.dart';
import 'package:blockcorp/features/countries/presentation/controllers/countries/home_controller.dart';
import 'package:blockcorp/features/countries/presentation/pages/countries_page.dart';
import 'package:blockcorp/features/countries/presentation/widgets/country_item.dart';
import 'package:blockcorp/features/countries/presentation/widgets/custom_button.dart';
import 'package:blockcorp/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController _controller = Get.put(sl<HomeController>());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Expanded(
                child: GetBuilder(
              init: _controller,
              builder: (_) {
                if (_controller.selectedCountriesList.isEmpty) {
                  return const Center(
                    child: Text(
                      'No country selected',
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                } else {
                  return ListView.builder(
                      itemCount: _controller.selectedCountriesList.length,
                      itemBuilder: ((context, index) {
                        return CountryItem(
                          commonName:
                              _controller.selectedCountriesList[index].commonName ?? '',
                          officialName:
                              _controller.selectedCountriesList[index].officialName ??
                                  '',
                          hasCheckbox: false,
                        );
                      }));
                }
              },
            )),
            CustomButton(
              name: 'Add countries',
              onPressed: () async {
                var selectedCountries = await Navigator.pushNamed(
                    context, countriesListRoute,
                    arguments: CountriesListPage(
                        selectedCountries: _controller.selectedCountriesList));

                _controller
                    .addSelectedCountries(selectedCountries as List<Countries>);
              },
            )
          ],
        ),
      ),
    );
  }
}
