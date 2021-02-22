import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stack_fincer_assignment/pages/splash_page/splash_page.dart';
import 'package:stack_fincer_assignment/utils/Log.dart';
import 'package:stack_fincer_assignment/utils/resource/color_constant.dart';
import 'package:stack_fincer_assignment/utils/resource/strings.dart';
import 'blocs/quiz_bloc.dart';
import 'dependency_injections.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    setupDependencyInjections();
    runApp(MyApp());
  }, (error, stackTrace) {
    Log.v("Error Message : ${stackTrace.toString()}");
    Log.v("Error Type : ${error.runtimeType}");
  });
}

class MyApp extends StatelessWidget with PortraitModeMixin {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark));
    super.build(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<QuizBloc>(
          create: (context) => QuizBloc(
            QuizInitial(),
          ),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          textSelectionHandleColor: Colors.transparent,
          primaryColor: ColorConstant.PRIMARY,
          primarySwatch: ColorConstant.PRIMARY_COLOR_LIGHT,
          textSelectionColor: Colors.transparent,
          primaryColorDark: ColorConstant.PRIMARY,
        ),
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
          DemoLocalizationsDelegate()
        ],
        debugShowCheckedModeBanner: false,
        title: Strings().appName,
        home: SplashPage(),
      ),
    );
  }
}

mixin PortraitModeMixin on StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return null;
  }
}

void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class Application {
  static BuildContext _context;

  Application(BuildContext context) {
    _context = context;
  }

  static BuildContext getContext() {
    return _context;
  }
}
