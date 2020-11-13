import 'package:clean_arch/modules/search/domain/errors/errors.dart';
import 'package:clean_arch/modules/search/domain/entities/result_search.dart';
import 'package:clean_arch/modules/search/domain/repositories/search_repository.dart';
import 'package:clean_arch/modules/search/infra/datasources/search_datasource.dart';

class SeachRepositoryImpl implements SearchRepository {
  final SearchDataSource datasource;

  SeachRepositoryImpl(this.datasource);

  @override
  Future<List<ResultSearch>> search(String searchText) async {
    try {
      final result = await datasource.getSearch(searchText);
      return result;
    } on DataSourceError catch (e) {
      throw e;
    } catch (e) {
      throw DataSourceError(e);
    }
  }
}
