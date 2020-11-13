import 'package:clean_arch/modules/search/presenter/search_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'domain/repositories/search_repository.dart';
import 'domain/usercases/seach_by_text_impl.dart';
import 'domain/usercases/search_by_text.dart';
import 'external/datasources/github_datasource.dart';
import 'infra/datasources/search_datasource.dart';
import 'infra/repositories/search_repository_impl.dart';

class AppModule {
  static initModule() {
    Get.put<Dio>(Dio());
    Get.put<SearchDataSource>(GithubDataSourceImpl(Get.find()));
    Get.put<SearchRepository>(SeachRepositoryImpl(Get.find()));
    Get.put<SearchByText>(SearchByTextImpl(Get.find()));
    Get.put<SearchController>(SearchController(Get.find()));
  }
}
