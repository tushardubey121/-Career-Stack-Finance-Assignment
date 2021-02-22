import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stack_fincer_assignment/blocs/bloc_manager.dart';
import 'package:stack_fincer_assignment/blocs/quiz_bloc.dart';
import 'package:stack_fincer_assignment/data/api/api_service.dart';
import 'package:stack_fincer_assignment/data/models/request/quiz_request.dart';
import 'package:stack_fincer_assignment/data/models/response/quiz_response.dart';
import 'package:stack_fincer_assignment/pages/custom_widgets/screen_with_loader.dart';
import 'package:stack_fincer_assignment/pages/custom_widgets/tap_widget.dart';
import 'package:stack_fincer_assignment/utils/resource/color_constant.dart';
import 'package:stack_fincer_assignment/utils/resource/strings.dart';
import 'package:stack_fincer_assignment/utils/resource/styles.dart';
import 'package:stack_fincer_assignment/utils/utility.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  var _isLoading = false;
  QuizBloc _quizBloc;
  List<Results> _quizResponse = List();
  var _pageViewController = PageController();
  int _currentPage = 0;
  int _currentCount = 0;

  void _handleRecommendedListResponse(GetQuizState state) {
    try {
      setState(() {
        switch (state.apiState) {
          case ApiStatus.LOADING:
            _isLoading = true;
            break;
          case ApiStatus.SUCCESS:
            _quizResponse.clear();
            _quizResponse = state.response.results;
            _isLoading = false;
            break;
          case ApiStatus.ERROR:
            _isLoading = false;
            break;
          case ApiStatus.INITIAL:
            break;
        }
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    _quizBloc = BlocProvider.of<QuizBloc>(context);
    return BlocManager(
      initState: (context) {
        _quizBloc.add(
          GetQuiz(
            request: QuizRequest(
                type: "boolean", amount: 10, category: 12, difficulty: "easy"),
          ),
        );
      },
      child: BlocListener<QuizBloc, QuizState>(
        listener: (context, state) {
          if (state is GetQuizState) _handleRecommendedListResponse(state);
        },
        child: Scaffold(
          backgroundColor: ColorConstant.WHITE,
          resizeToAvoidBottomInset: true,
          key: _key,
          appBar: _appBar(),
          bottomNavigationBar: _bottomBar(),
          body: ScreenWithLoader(
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: ColorConstant.WHITE,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _body(),
            ),
            isLoading: _isLoading,
          ),
        ),
      ),
    );
  }

  _appBar() {
    return AppBar(
      title: Text(
        Strings.of(context).appName,
        style: Styles.boldBlack(size: 18),
      ),
      elevation: 0,
      brightness: Brightness.light,
      backgroundColor: ColorConstant.WHITE,
      centerTitle: true,
    );
  }

  _bottomBar() {
    return Wrap(
      children: [
        BottomAppBar(
          elevation: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _dotView(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [_previous(), _next()],
              ),
            ],
          ),
        ),
      ],
    );
  }

  _previous() {
    return TapWidget(
      onTap: () {
        _pageViewController.previousPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2.35,
        height: 50,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: _currentPage == 0 ? Colors.transparent : Colors.black,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          _currentPage == 0 ? "" : "Previous",
          style: Styles.boldBlack(size: 16),
        ),
      ),
    );
  }

  _next() {
    return TapWidget(
      onTap: () {
        _pageViewController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2.35,
        height: 50,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: Colors.black)),
        alignment: Alignment.center,
        child: Text(
          "Next",
          style: Styles.boldBlack(size: 16),
        ),
      ),
    );
  }

  _dotView() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: _quizResponse.length == 0
          ? SizedBox()
          : DotsIndicator(
              dotsCount: _quizResponse.length,
              position: _currentPage.toDouble(),
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                color: Colors.grey,
                activeColor: Colors.black,
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
    );
  }

  Widget _body() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: PageView.builder(
        itemBuilder: (context, index) {
          return _pageItem(_quizResponse[index]);
        },
        onPageChanged: (currentPage) {
          setState(() {
            _currentPage = currentPage;
          });
        },
        controller: _pageViewController,
        itemCount: _quizResponse.length,
      ),
    );
  }

  _pageItem(Results quizResponse) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "$_currentCount/${_quizResponse.length}",
                style: Styles.boldBlack(size: 30),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              quizResponse.question ?? "",
              style: Styles.regularBlack(size: 20),
            ),
          ),
          TapWidget(
            onTap: () {
              setState(() {
                if (quizResponse.selected.isNotEmpty) return;
                quizResponse.selected = "True";
                if (quizResponse.selected == quizResponse.correctAnswer) {
                  _currentCount++;
                  snackBar(value: "Correct");
                } else {
                  _currentCount--;
                  snackBar(value: "Incorrect");
                }
              });
            },
            child: Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(
                    horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Text(
                  "True",
                  style: Styles.regularBlack(size: 15),
                ),
              ),
            ),
          ),
          TapWidget(
            onTap: () {
              setState(() {
                if (quizResponse.selected.isNotEmpty) return;
                quizResponse.selected = "False";
                if (quizResponse.selected == quizResponse.correctAnswer) {
                  _currentCount++;
                  snackBar(value: "Correct");
                } else {
                  _currentCount--;
                  snackBar(value: "Incorrect");
                }
              });
            },
            child: Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(
                    horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Text(
                  "False",
                  style: Styles.regularBlack(size: 15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  snackBar({String value}) {
    Utility.showSnackBar(key: _key, message: "Your answer is $value");
  }
}
