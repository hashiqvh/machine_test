import 'package:country_code_picker/country_code.dart';
import 'package:flutter/material.dart';
import 'package:machine_test/core/const/constants.dart';
import 'package:machine_test/core/provider/auth_provider.dart';
import 'package:machine_test/ui/widget/count_down_widget.dart';
import 'package:machine_test/ui/widget/otp_widget.dart';
import 'package:machine_test/ui/widget/title_text.dart';
import 'package:provider/provider.dart';

class OtpPage extends StatelessWidget {
  final String number;
  final CountryCode countryCode;
  OtpPage({
    Key? key,
    required this.countryCode,
    required this.number,
  }) : super(key: key);
  final TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Consumer<AuthProvider>(
            builder: (context, value, child) {
              if (value.otpnumber != null) {
                Future.delayed(Duration.zero, () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            backgroundColor: Constants.backgroundColor,
                            contentPadding: EdgeInsets.zero,
                            content: Container(
                              height: 150,
                              child: Column(
                                children: [
                                  Align(
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: Constants.primaryColor),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: InkWell(
                                            onTap: () => Navigator.pop(context),
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )),
                                    alignment: Alignment.topRight,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(children: [
                                      Icon(
                                        Icons.mail_outline,
                                        color: Constants.butttonColor,
                                        size: 40,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Flexible(
                                        child: Text(
                                          "OTP has been sent to your mobile please check \n OTP ${value.otpnumber}",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                          ));
                });
              }
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TitleText(
                          text:
                              "We send you an OTP to your registerd mobile number"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Enter the 4 digit verification code below',
                      style: Theme.of(context).textTheme.bodyText1!.merge(
                          TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal)),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    OtpWidget(
                        textEditingController: otpController,
                        authProvider: value,
                        countryCode: countryCode,
                        phoneNumber: number),
                    const SizedBox(height: 44),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${countryCode.dialCode} ${number}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white30,
                          ),
                        ),
                        Text(
                          'Edit',
                          style: TextStyle(
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            color: Constants.butttonColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Didn’t receive code?  ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white30,
                          ),
                        ),
                        CownDownWidget(),
                      ],
                    ),
                  ]);
            },
          ),
        ),
      ),
    );
  }
}
