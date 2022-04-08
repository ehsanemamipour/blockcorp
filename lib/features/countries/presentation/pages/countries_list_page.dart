import 'package:blockcorp/features/countries/domain/entities/countries.dart';
import 'package:blockcorp/features/countries/presentation/widgets/country_item.dart';
import 'package:blockcorp/features/countries/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CountriesListPage extends StatelessWidget {
  const CountriesListPage({Key? key, required this.selectedCountries})
      : super(key: key);
  final List<Countries>? selectedCountries;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 55,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(29), color: Colors.blue),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.search,
                    size: 24,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: Colors.white,
                      onChanged: (text) {},
                      cursorWidth: 1,
                      decoration: InputDecoration(
                          hintText: 'search',
                          hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 15),
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 30,
                    itemBuilder: ((context, index) {
                      return CountryItem(
                        commonName: 'ssss',
                        officialName: 'asdad',
                        hasCheckbox: true,
                        checkboxValue: true,
                        onChanged: (value) {},
                      );
                    }))),
            CustomButton(
              name: 'Done',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
