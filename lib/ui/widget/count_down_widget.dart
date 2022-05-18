import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';

class CownDownWidget extends StatefulWidget {
  const CownDownWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CownDownWidget> createState() => _CownDownWidgetState();
}

class _CownDownWidgetState extends State<CownDownWidget> {
  bool resent = false;
  @override
  Widget build(BuildContext context) {
    return resent
        ? Text(
            'Resend',
            style: TextStyle(
              fontSize: 14,
              decoration: TextDecoration.underline,
              color: Colors.white30,
            ),
          )
        : Countdown(
            seconds: 30,
            build: (BuildContext context, double time) => Text(
              time.toInt().toString(),
              style: TextStyle(
                fontSize: 14,
                decoration: TextDecoration.underline,
                color: Colors.white30,
              ),
            ),
            interval: Duration(milliseconds: 100),
            onFinished: () {
              setState(() {
                resent = true;
              });
              print('Timer is done!');
            },
          );
  }
}
