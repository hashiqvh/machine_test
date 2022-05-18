import 'package:flutter/material.dart';
import 'package:machine_test/ui/widget/button_widget.dart';
import 'package:machine_test/ui/widget/custom_form_field.dart';
import 'package:machine_test/ui/widget/title_text.dart';

class AccountCreate extends StatelessWidget {
  AccountCreate({Key? key}) : super(key: key);
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dateofbirthNameController =
      TextEditingController();
  final TextEditingController heighttNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TitleText(text: "Tell us about you now."),
            SizedBox(
              height: 30,
            ),
            CustomFormField(
              hintText: "First Name",
              controller: firstNameController,
              prefix: Icon(
                Icons.person,
                color: Colors.white30,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CustomFormField(
              hintText: "Last Name",
              controller: firstNameController,
              prefix: Icon(
                Icons.person,
                color: Colors.white30,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ButtonWidget(ontap: () {}, title: "Next"),
          ],
        ),
      )),
    );
  }
}
