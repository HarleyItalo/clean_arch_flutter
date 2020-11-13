import 'package:clean_arch/modules/search/app_module.dart';
import 'package:clean_arch/modules/search/domain/entities/result_search.dart';
import 'package:clean_arch/modules/search/presenter/search_controller.dart';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

import '../../../app_module_test.dart';
import '../external/utils/github_result.dart';

main() {
  final dio = DioMock();
  Get.put<Dio>(dio);
  AppModule.initModule();
  SearchController useCase = Get.find();

  when(dio.get(any))
      .thenAnswer((_) async => Response(data: gitHubResult, statusCode: 200));

  test('Deve retornar uma lista de ResultSearch', () async {
    await useCase.getList('harley');
    expect(useCase.data, isA<List<ResultSearch>>());
  });
}
