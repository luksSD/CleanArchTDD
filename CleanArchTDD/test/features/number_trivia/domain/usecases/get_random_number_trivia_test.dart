import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:teste/core/usecases/usecase.dart';
import 'package:teste/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste/features/number_trivia/domain/usecases/get_random_number_trivia.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late GetRandomNumberTriviaUsecase usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTriviaUsecase(mockNumberTriviaRepository);
  });

  const tNumberTrivia = NumberTrivia(
    text: 'test',
    number: 1,
  );

  test(
    'should get trivia from the repository',
    () async {
      // arrange
      when(mockNumberTriviaRepository.getRandomNumberTrivia())
          .thenAnswer((_) async => const Right(tNumberTrivia));

      // act
      final result = await usecase(NoParams());

      // assert
      expect(result, const Right(tNumberTrivia));
      verify(mockNumberTriviaRepository.getRandomNumberTrivia());
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
