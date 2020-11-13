import 'package:clean_arch/modules/search/domain/entities/result_search.dart';
import 'package:clean_arch/modules/search/domain/errors/errors.dart';
import 'package:clean_arch/modules/search/domain/usercases/search_by_text.dart';

import 'package:get/get.dart';

class SearchController extends GetxController {
  final SearchByText _useCase;

  var data = List<ResultSearch>().obs;
  var hasError = ''.obs;

  SearchController(this._useCase);

  getList(String searchText) async {
    try {
      hasError.value = '';
      final response = await _useCase(searchText);
      data.value = response;
      return data;
    } on DataSourceError catch (e) {
      hasError.value = e.message.toString();
      data.clear();
    } on InvalidTextError {
      hasError.value = '';
    }
  }
}
