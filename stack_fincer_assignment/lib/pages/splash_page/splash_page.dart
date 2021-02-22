import 'package:flutter/material.dart';
import 'package:stack_fincer_assignment/pages/custom_widgets/next_page_route.dart';
import 'package:stack_fincer_assignment/pages/quiz_pages/quiz_page.dart';
import 'package:stack_fincer_assignment/utils/resource/color_constant.dart';
import 'package:stack_fincer_assignment/utils/resource/images.dart';
import 'package:stack_fincer_assignment/utils/utility.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    Utility.waitFor(3).then((value) {
      Navigator.pushAndRemoveUntil(
        context,
        NextPageRoute(QuizPage()),
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorConstant.WHITE,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(50),
        child: Image.network(Images.LOGO),
      ),
    );
  }

  _size({double height = 10}) {
    return SizedBox(
      height: height,
    );
  }
}
