import 'package:flutter/material.dart';
import 'package:stack_fincer_assignment/utils/resource/strings.dart';
import 'package:stack_fincer_assignment/utils/resource/styles.dart';

class AlertsWidget {
  AlertsWidget._();

  static AlertsWidget _instance;

  static AlertsWidget getInstance() => _instance ?? AlertsWidget._();

  Future alertWithOkCancelBtn({
    @required BuildContext context,
    String title = "Alert!",
    String okText = "",
    String cancelText = "",
    String text = "",
    Function onOkClick,
    Function onCancelClick,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text(title),
            content: Text(text),
            actions: <Widget>[
              FlatButton(
                child: new Text(
                  cancelText ?? Strings.of(context).cancel,
                  style: Styles.boldBlack(),
                ),
                onPressed: () {
                  if (onCancelClick != null) onCancelClick();
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: new Text(
                  okText ?? Strings.of(context).ok,
                  style: Styles.boldBlack(),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  if (onOkClick != null) onOkClick();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future alertWithOkBtn({
    @required BuildContext context,
    String text = "",
    Function onOkClick,
    String title = "Alert!",
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text(
              title,
              style: Styles.boldBlack(size: 20),
            ),
            content: Text(text, style: Styles.boldBlack(size: 16)),
            actions: <Widget>[
              FlatButton(
                child: new Text(Strings.of(context).ok,
                    style: Styles.boldBlack(size: 14)),
                onPressed: () {
                  Navigator.of(context).pop();
                  if (onOkClick != null) onOkClick();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
