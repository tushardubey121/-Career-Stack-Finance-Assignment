import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NextPageRoute extends CupertinoPageRoute {
  Widget _whichScreen;

  NextPageRoute(this._whichScreen)
      : super(
            builder: (BuildContext context) => _whichScreen,
            maintainState: false);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new CupertinoPageTransition(
      primaryRouteAnimation: animation,
      secondaryRouteAnimation: secondaryAnimation,
      child: _whichScreen,
      linearTransition: true,
    );
  }
}
