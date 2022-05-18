import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:machine_test/core/const/constants.dart';
import 'package:machine_test/core/provider/auth_provider.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpWidget extends StatelessWidget {
  final AuthProvider authProvider;
  final String phoneNumber;
  final CountryCode countryCode;
  final TextEditingController textEditingController;
  const OtpWidget({
    Key? key,
    required this.countryCode,
    required this.phoneNumber,
    required this.authProvider,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
        child: PinCodeTextField(
          controller: textEditingController,
          appContext: context,

          length: 4,

          blinkWhenObscuring: true,
          animationType: AnimationType.fade,
          validator: (v) {
            if (v!.length < 3) {
              return "Enter Correct otp";
            } else {
              return null;
            }
          },
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            activeFillColor: Constants.primaryColor,
            inactiveColor: Color.fromARGB(255, 20, 23, 37),
            selectedColor: Color.fromARGB(255, 20, 23, 37),
            activeColor: Constants.primaryColor,
            selectedFillColor: Constants.primaryColor,
            inactiveFillColor: Constants.primaryColor,
          ),
          cursorColor: Colors.black,

          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
          //  errorAnimationController: errorController,
          //  controller: textEditingController,
          keyboardType: TextInputType.number,
          boxShadows: const [
            BoxShadow(
              offset: Offset(0, 1),
              color: Colors.black12,
              blurRadius: 10,
            )
          ],
          onCompleted: (v) {
            authProvider.verifyOtp(
                context,
                phoneNumber,
                countryCode.dialCode.toString(),
                countryCode.code.toString(),
                textEditingController.text);
          },
          // onTap: () {
          //   print("Pressed");
          // },
          onChanged: (value) {
            debugPrint(value);
            // setState(() {
            //   currentText = value;
            // });
          },
          beforeTextPaste: (text) {
            debugPrint("Allowing to paste $text");
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
        ));
  }
}
