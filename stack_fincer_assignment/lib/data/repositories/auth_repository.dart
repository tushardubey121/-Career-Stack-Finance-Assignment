import 'package:meta/meta.dart';
import 'package:stack_fincer_assignment/data/models/request/quiz_request.dart';
import 'package:stack_fincer_assignment/data/models/response/quiz_response.dart';
import 'package:stack_fincer_assignment/data/providers/auth_provider.dart';

class AuthRepository {
  AuthRepository({@required this.authProvider});

  final AuthProvider authProvider;

  Future<QuizResponse> getQuiz({QuizRequest request}) async {
    final response = await authProvider.getQuiz(request:request);
    if (response.success) {
      QuizResponse _response = QuizResponse.fromJson(response.body);
      return _response;
    } else {
      return QuizResponse(responseCode: 0, results: null);
    }
  }
}
