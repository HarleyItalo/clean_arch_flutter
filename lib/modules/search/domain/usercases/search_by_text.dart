import 'package:clean_arch/modules/search/domain/entities/result_search.dart';

abstract class SearchByText {
  Future<List<ResultSearch>> call(String searchText);
}
