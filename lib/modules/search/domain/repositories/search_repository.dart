import 'package:clean_arch/modules/search/domain/entities/result_search.dart';

abstract class SearchRepository {
  Future<List<ResultSearch>> search(String searchText);
}
