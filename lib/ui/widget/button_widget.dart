import 'package:flutter/material.dart';
import 'package:machine_test/core/const/constants.dart';

class ButtonWidget extends StatelessWidget {
  final Function() ontap;
  final String title;
  const ButtonWidget({
    Key? key,
    required this.ontap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Constants.butttonColor,
          borderRadius: BorderRadius.circular(10),
          gradient: RadialGradient(
            center: Alignment(0, 0),
            colors: [
              Constants.butttonColor,
              Color.fromARGB(255, 233, 167, 137),
              Constants.butttonColor,
            ],
            radius: 3.0,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: Constants.textStyle2(context),
          ),
        ),
      ),
    );
  }
}
