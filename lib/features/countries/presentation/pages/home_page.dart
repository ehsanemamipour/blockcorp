import 'package:blockcorp/core/router/router.dart';
import 'package:blockcorp/features/countries/presentation/pages/countries_list_page.dart';
import 'package:blockcorp/features/countries/presentation/widgets/country_item.dart';
import 'package:blockcorp/features/countries/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: ((context, index) {
                      return const CountryItem(
                        commonName: 'ssss',
                        officialName: 'asdad',
                        hasCheckbox: false,
                      );
                    }))),
            CustomButton(
              name: 'Add countries',
              onPressed: () {
                Navigator.pushNamed(context, countriesListRoute,
                    arguments: const CountriesListPage(selectedCountries: []));
              },
            )
          ],
        ),
      ),
    );
  }
}
