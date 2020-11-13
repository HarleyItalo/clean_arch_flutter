import 'package:clean_arch/modules/search/domain/entities/result_search.dart';
import 'package:clean_arch/modules/search/domain/errors/errors.dart';
import 'package:clean_arch/modules/search/domain/repositories/search_repository.dart';
import 'package:clean_arch/modules/search/domain/usercases/seach_by_text_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SeachRepositoryMock extends Mock implements SearchRepository {}

main() {
  final repository = SeachRepositoryMock();
  final usercase = SearchByTextImpl(repository);
  test('dever retornar um lista de result search', () async {
    when(repository.search(any))
        .thenAnswer((realInvocation) async => <ResultSearch>[]);

    final result = await usercase('harley');
    expect(result, isA<List<ResultSearch>>());
  });
  test('dever retornar um InvalidTextError quando o campo for vazio ou nulo',
      () async {
    when(repository.search(any))
        .thenAnswer((realInvocation) async => <ResultSearch>[]);

    try {
      await usercase(null);
    } catch (e) {
      expect(e, isA<InvalidTextError>());
    }

    // result = await usercase('');
    // expect(result, isA<InvalidTextError>());
  });
}
