import 'dart:developer';

import 'package:country_code_picker/country_code.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machine_test/ui/signup/account_create.dart';
import 'package:machine_test/ui/signup/otp_page.dart';

class AuthProvider with ChangeNotifier {
  String baseUrl = "http://api.rematchglobal.com";
  CountryCode countryCode = CountryCode();
  bool validate = false;
  int? otpnumber;
  setCountryCode(CountryCode countrycode) {
    log("message");
    countryCode = countrycode;
    notifyListeners();
  }

  setOtpNumber(int number) {
    log("otp");
    otpnumber = number;
    notifyListeners();
  }

  setValidate() {
    validate = !validate;
    notifyListeners();
  }

  createAccount(BuildContext context, String phoneNumber, String countryode,
      String alphaCode, String email) async {
    try {
      var response = await Dio().post(baseUrl + "/users/account", data: {
        "phone": phoneNumber,
        "country_code": countryode,
        "country_iso_alpha3_code": alphaCode,
        "email": email,
      });
      if (response.statusCode == 200) {
        if (response.data["success"] == true) {
          sendOtp(context, phoneNumber, countryode, alphaCode);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    OtpPage(countryCode: countryCode, number: phoneNumber),
              ));
        } else if (response.data["success"] == false) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(response.data["errors"][0]["message"].toString()),
          ));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response.data["errors"][0]["message"].toString()),
        ));
      }
      print(response);
    } catch (e) {
      print(e);
    }
  }

  sendOtp(BuildContext context, String phoneNumber, String countryCode,
      String alphaCode) async {
    try {
      var response = await Dio().post(baseUrl + "/users/account/otp", data: {
        "phone": phoneNumber,
        "country_code": countryCode,
        "country_iso_alpha3_code": alphaCode,
      });
      if (response.statusCode == 200) {
        setOtpNumber(response.data['otp']);
        log(response.data.toString());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response.data.toString()),
        ));
      }
      print(response);
    } catch (e) {
      print(e);
    }
  }

  verifyOtp(
    BuildContext context,
    String phoneNumber,
    String countryCode,
    String alphaCode,
    String otp,
  ) async {
    try {
      var response =
          await Dio().post(baseUrl + "/users/account/otp/verify", data: {
        "phone": phoneNumber,
        "country_code": countryCode,
        "country_iso_alpha3_code": alphaCode,
        "otp": otp
      });
      if (response.statusCode == 200) {
        if (response.data['success'] == true) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AccountCreate(),
              ));
        } else if (response.data["success"] == false) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(response.data["errors"][0]["message"].toString()),
          ));
        }
        log(response.data.toString());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response.data.toString()),
        ));
      }
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
