import 'package:clean_arch/modules/search/domain/errors/errors.dart';
import 'package:clean_arch/modules/search/external/datasources/github_datasource.dart';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../utils/github_result.dart';

class DioMock extends Mock implements Dio {}

main() {
  final client = DioMock();
  final dataSource = GithubDataSourceImpl(client);

  test('Deve retornar o lista de resultModel', () async {
    when(client.get(any)).thenAnswer((realInvocation) async =>
        Response(data: gitHubResult, statusCode: 200));
    final result = dataSource.getSearch('harley');
    expect(result, completes);
  });
  test('Deve retornar um dataSource Error se o status diferente de 200',
      () async {
    when(client.get(any)).thenAnswer((realInvocation) async =>
        Response(data: gitHubResult, statusCode: 401));
    final result = dataSource.getSearch('harley');
    expect(result, throwsA(isA<DataSourceError>()));
  });
}
