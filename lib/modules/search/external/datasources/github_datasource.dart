import 'package:clean_arch/modules/search/domain/errors/errors.dart';
import 'package:clean_arch/modules/search/infra/datasources/search_datasource.dart';
import 'package:clean_arch/modules/search/infra/models/result_seach_model.dart';
import 'package:dio/dio.dart';

extension on String {
  normalize() {
    return this.replaceAll(" ", "+");
  }
}

class GithubDataSourceImpl implements SearchDataSource {
  final Dio client;

  GithubDataSourceImpl(this.client);

  @override
  Future<List<ResultSearchModel>> getSearch(String searchText) async {
    final response = await client
        .get("https://api.github.com/search/users?q=${searchText.normalize()}");
    if (response.statusCode == 200) {
      return (response.data['items'] as List).map((e) {
        return ResultSearchModel.fromMap(e);
      }).toList();
    } else {
      throw DataSourceError('Erro do gitHub');
    }
  }
}
