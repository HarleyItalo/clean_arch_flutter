import 'package:clean_arch/modules/search/infra/models/result_seach_model.dart';

abstract class SearchDataSource {
  Future<List<ResultSearchModel>> getSearch(String searchText);
}
