import 'package:clean_arch/modules/search/app_module.dart';
import 'package:clean_arch/modules/search/domain/entities/result_search.dart';
import 'package:clean_arch/modules/search/domain/usercases/seach_by_text_impl.dart';
import 'package:clean_arch/modules/search/domain/usercases/search_by_text.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'modules/seach/external/utils/github_result.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  Get.put<Dio>(dio);
  AppModule.initModule();

  test('Deve recuperar user case sem erro', () {
    SearchByText usercase = Get.find();
    expect(usercase, isA<SearchByTextImpl>());
  });

  test('Deve trazer um list de resultSearch', () async {
    when(dio.get(any)).thenAnswer((realInvocation) async =>
        Response(statusCode: 200, data: gitHubResult));

    SearchByText usercase = Get.find();
    final result = await usercase.call('harley');
    expect(result, isA<List<ResultSearch>>());
  });
}
