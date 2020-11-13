import 'package:clean_arch/modules/search/domain/entities/result_search.dart';
import 'package:clean_arch/modules/search/domain/errors/errors.dart';
import 'package:clean_arch/modules/search/infra/datasources/search_datasource.dart';
import 'package:clean_arch/modules/search/infra/models/result_seach_model.dart';
import 'package:clean_arch/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchDataSourceMock extends Mock implements SearchDataSource {}

main() {
  final dataSource = SearchDataSourceMock();
  final repository = SeachRepositoryImpl(dataSource);
  test('deve retornar uma lista de seachResult', () async {
    when(dataSource.getSearch(any))
        .thenAnswer((_) async => <ResultSearchModel>[]);
    var result = await repository.search('harley');

    expect(result, isA<List<ResultSearch>>());
  });
  test('deve retornar um erro se o datasource falhar', () async {
    when(dataSource.getSearch(any)).thenThrow((_) => Exception());
    try {
      await repository.search('harley');
    } catch (e) {
      expect(e, isA<DataSourceError>());
    }
  });
}
