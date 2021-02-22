import 'package:bloc/bloc.dart';
import 'package:injector/injector.dart';
import 'package:stack_fincer_assignment/data/api/api_service.dart';
import 'package:stack_fincer_assignment/data/models/request/quiz_request.dart';
import 'package:stack_fincer_assignment/data/models/response/general_response.dart';
import 'package:stack_fincer_assignment/data/models/response/quiz_response.dart';
import 'package:stack_fincer_assignment/data/repositories/auth_repository.dart';

//create event
abstract class QuizEvent {
  QuizEvent([List event = const []]);
}

class GetQuiz extends QuizEvent {
  QuizRequest request;

  GetQuiz({this.request}) : super([request]);
}

//create state
abstract class QuizState {
  QuizState([List states = const []]) : super();
}

//create initial State
class QuizInitial extends QuizState {
  QuizInitial() : super([]);
}

//create state
class GetQuizState extends QuizState {
  ApiStatus state;

  ApiStatus get apiState => state;
  QuizResponse response;
  String error;

  GetQuizState(this.state, {this.response, this.error});
}

//bloc start
class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final authRepository = Injector.appInstance.get<AuthRepository>();

  QuizBloc(QuizState initialState) : super(initialState);

  @override
  Stream<QuizState> mapEventToState(QuizEvent event) async* {
    var type = event.runtimeType;
    switch (type) {
      case GetQuiz:
        try {
          yield GetQuizState(ApiStatus.LOADING);
          final response = await authRepository.getQuiz(
            request: (event as GetQuiz).request,
          );
          if (response.responseCode == 0) {
            yield GetQuizState(ApiStatus.SUCCESS, response: response);
          } else {
            yield GetQuizState(ApiStatus.ERROR, error: "response.error");
          }
        } catch (e) {
          yield GetQuizState(ApiStatus.ERROR, error: "Something went wrong!");
        }
        break;
    }
  }
}
