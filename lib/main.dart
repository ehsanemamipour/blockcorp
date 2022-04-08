import 'package:blockcorp/features/countries/presentation/controllers/countries/countries_controller.dart';
import 'package:blockcorp/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:blockcorp/injection_container.dart' as di;
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CountriesController sss = Get.put(sl<CountriesController>());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: sss,
        builder: (con) {
          return Container(
            color: Colors.red,
            child: InkWell(
                onTap: () {
                  sss.fetchData();
                },
                child: Container(
                  height: 150,
                  width: 150,
                  color: Colors.amber,
                )),
          );
        },
      ),
    );
  }
}
