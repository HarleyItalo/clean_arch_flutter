import 'package:clean_arch/modules/search/domain/entities/result_search.dart';
import 'package:clean_arch/modules/search/domain/errors/errors.dart';
import 'package:clean_arch/modules/search/domain/repositories/search_repository.dart';
import 'package:clean_arch/modules/search/domain/usercases/search_by_text.dart';

class SearchByTextImpl implements SearchByText {
  final SearchRepository repository;

  SearchByTextImpl(this.repository);

  @override
  Future<List<ResultSearch>> call(String searchText) async {
    if (searchText == null || searchText.isEmpty) {
      throw InvalidTextError();
    }
    return repository.search(searchText);
  }
}
