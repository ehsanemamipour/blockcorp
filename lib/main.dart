import 'package:flutter/material.dart';
import 'package:blockcorp/injection_container.dart' as di;
import 'package:blockcorp/core/router/router.dart' as route;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MaterialApp(
    onGenerateRoute: route.Router.generateRoute,
    initialRoute: route.homeRoute,
  ));
}
