import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:teste/core/error/exceptions.dart';
import 'package:teste/core/plataform/network_info.dart';
import 'package:teste/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:teste/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:teste/features/number_trivia/domain/repositories/number_trivia_repository.dart';

@GenerateMocks(
  [
    NumberTriviaRepository,
    NumberTriviaRemoteDataSource,
    NumberTriviaLocalDataSource,
    NetworkInfo,
    ServerException,
    CacheException,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
