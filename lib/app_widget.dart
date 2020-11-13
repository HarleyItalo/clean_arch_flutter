import 'package:clean_arch/modules/search/app_module.dart';
import 'package:clean_arch/modules/search/presenter/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppModule.initModule();
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      getPages: [GetPage(name: '/', page: () => SearchPage())],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
