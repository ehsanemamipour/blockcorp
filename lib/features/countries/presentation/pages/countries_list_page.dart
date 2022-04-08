import 'dart:async';

import 'package:blockcorp/features/countries/domain/entities/countries.dart';
import 'package:blockcorp/features/countries/presentation/controllers/countries/countries_controller.dart';
import 'package:blockcorp/features/countries/presentation/widgets/country_item.dart';
import 'package:blockcorp/features/countries/presentation/widgets/custom_button.dart';
import 'package:blockcorp/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountriesListPage extends StatefulWidget {
  const CountriesListPage({Key? key, required this.selectedCountries})
      : super(key: key);
  final List<Countries>? selectedCountries;

  @override
  State<CountriesListPage> createState() => _CountriesListPageState();
}

class _CountriesListPageState extends State<CountriesListPage> {
  @override
  Widget build(BuildContext context) {
    final CountriesController _controller = Get.put(sl<CountriesController>());
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
                child: GetBuilder(
                    init: _controller,
                    initState: (_) {
                      _controller.fetchData();
                    },
                    builder: (_) {
                      if (_controller.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (_controller.error != null) {
                        return Text(_controller.error ?? '');
                      }
                      return ListView.builder(
                          itemCount: _controller.countriesList.length,
                          itemBuilder: ((context, index) {
                            final _isSelectedStream =
                                StreamController<bool>.broadcast();
                            return StreamBuilder<bool>(
                                stream: _isSelectedStream.stream,
                                builder: (context, snapshot) {
                                  bool data = snapshot.data ?? false;
                                  return CountryItem(
                                    commonName: _controller
                                            .countriesList[index].commonName ??
                                        '',
                                    officialName: _controller
                                            .countriesList[index]
                                            .officialName ??
                                        '',
                                    hasCheckbox: true,
                                    checkboxValue: data,
                                    onChanged: (value) {
                                      _isSelectedStream.add(!data);
                                      if (value != null) {
                                        if (value) {
                                          _controller.addCountry(
                                              _controller.countriesList[index]);
                                        } else {
                                          _controller.removeCountry(
                                              _controller.countriesList[index]);
                                        }
                                      }
                                    },
                                  );
                                });
                          }));
                    })),
            CustomButton(
              name: 'Done',
              onPressed: () {
                Navigator.pop(context, _controller.selectesCountriesList);
              },
            )
          ],
        ),
      ),
    );
  }
}
