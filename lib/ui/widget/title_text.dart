import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  const TitleText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline4!.merge(TextStyle(
                  color: Colors.white,
                )),
            textAlign: TextAlign.center,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Color.fromARGB(
                255,
                226,
                131,
                97,
              ),
              width: 50,
              height: 1,
            ),
          ),
        )
      ],
    );
  }
}
