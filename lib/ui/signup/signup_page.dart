import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:machine_test/core/const/constants.dart';
import 'package:machine_test/core/provider/auth_provider.dart';
import 'package:machine_test/ui/widget/button_widget.dart';
import 'package:machine_test/ui/widget/custom_form_field.dart';
import 'package:machine_test/ui/widget/title_text.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);
  final TextEditingController phoneumberCOntroller = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Consumer<AuthProvider>(
          builder: (context, value, child) => Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleText(text: "Sign Up"),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Container(
                            height: 52,
                            decoration: BoxDecoration(
                                color: Constants.primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: CountryCodePicker(
                              textStyle: Constants.textStyle1(context),
                              onChanged: (country) {
                                value.setCountryCode(country);
                                log(country.code.toString());
                              },
                              showCountryOnly: true,
                              showOnlyCountryWhenClosed: false,
                              showDropDownButton: true,
                              flagWidth: 20,
                              showFlag: true,
                              showFlagMain: true,
                            ),
                          ),
                          value.countryCode.code == null && value.validate
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "choose Country",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 11),
                                  ),
                                )
                              : SizedBox()
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 4,
                      child: CustomFormField(
                          inputType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phonenumber.';
                            } else if (value.length < 5) {
                              return 'Please enter your phonenumber.';
                            }

                            return null;
                          },
                          controller: phoneumberCOntroller,
                          hintText: "Enter phone number"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                CustomFormField(
                  inputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address.';
                    }
                    return null;
                  },
                  controller: emailController,
                  hintText: "Enter phone email address",
                  prefix: Icon(
                    Icons.mail_outlined,
                    color: Colors.white30,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "This information is mandatory and is linked with your rematch account. You can use this details for account recovery or during change in your deivce",
                  textAlign: TextAlign.center,
                  style: Constants.textStyle2(context),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "OTP will be send to both the above email & phone. You can verify the next page",
                  textAlign: TextAlign.center,
                  style: Constants.textStyle2(context),
                ),
                SizedBox(
                  height: 30,
                ),
                ButtonWidget(
                  title: "Verify",
                  ontap: () {
                    value.setValidate();
                    log("${_formKey.currentState!.validate()}");
                    if (_formKey.currentState!.validate() &&
                        value.countryCode.code != null) {
                      log("${_formKey.currentState!.validate()}");
                      value.createAccount(
                        context,
                        phoneumberCOntroller.text,
                        value.countryCode.dialCode.toString(),
                        value.countryCode.code.toString(),
                        emailController.text,
                      );
                      print('Form is valid');
                    } else {
                      print('Form is invalid');
                    }
                  },
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
