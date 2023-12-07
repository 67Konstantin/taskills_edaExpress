import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../help_classes/exports.dart';
import '../../../router/app_router.dart';
import '../../widgets/exports.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  double screenWidth = 0.0;
  double screenHeight = 0.0;
  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: MyColor().greyBackground,
      body: Container(
        height: screenHeight,
        child: Stack(
          children: [
            Positioned(
              child: Image.asset(
                MyVariables.pathToBackGroundBlue,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: screenHeight * 0.15,
              left: screenWidth * 0.1,
              child: Column(
                children: [
                  Container(
                    width: screenWidth * 0.8,
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenHeight * 0.035,
                        ),
                        const Text(
                          'Привет',
                          //MyVariables.strAcquainted,

                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: screenHeight * 0.03,
                        ),
                        buildCustomTextField(
                          label: MyVariables.strName,
                          //AppLocalizations.of(context).strName,
                          onChanged: (value) {
                            name = value;
                          },
                        ),
                        SizedBox(
                          height: screenHeight * 0.005,
                        ),
                        buildCustomTextField(
                          label: MyVariables.strEmail,
                          //AppLocalizations.of(context).strEmail,
                          isEmail: true,
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                        SizedBox(
                          height: screenHeight * 0.005,
                        ),
                        buildCustomTextField(
                          label: MyVariables.strPassword,
                          //AppLocalizations.of(context).strPassword,
                          isPassword: true,
                          onChanged: (value) {
                            password = value;
                          },
                        ),
                        SizedBox(
                          height: screenHeight * 0.005,
                        ),
                        buildCustomTextField(
                          label: MyVariables.strConfirmPassword,
                          //AppLocalizations.of(context).strConfirmPassword,
                          isPassword: true,
                          onChanged: (value) {
                            confirmPassword = value;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  Container(
                    width: screenWidth * 0.6,
                    child: ElevatedButton(
                      onPressed: () {
                        if (password == confirmPassword &&
                            password.length >= 8 &&
                            _isEmailValid(email) &&
                            name.isNotEmpty) {
                          AutoRouter.of(context).replace(AccountRoute());
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Неверно или некоректно введены поля'
                                  //AppLocalizations.of(context).strValidateSignUp
                                  ),
                              duration: Duration(seconds: 5),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: MyColor().mainBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              MyVariables.strSignUp,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      AutoRouter.of(context).replace(SignInRoute());
                    },
                    child: Text(
                      MyVariables.strAlreadyHaveAccount,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: MyColor().mainBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: screenHeight * 0.10,
              left: screenWidth * 0.5 - screenHeight * 0.05,
              child: Container(
                height: screenHeight * 0.1,
                width: screenHeight * 0.1,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: MyColor().mainBlue,
                  border: Border.all(color: Colors.white, width: 2.0),
                ),
                child: Center(
                  child: Icon(
                    Icons.account_circle_rounded,
                    size: screenHeight * 0.05,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCustomTextField({
    bool isPassword = false,
    bool isEmail = false,
    String label = '',
    required Function(String) onChanged,
  }) {
    return Container(
      height: screenHeight * 0.09,
      width: screenWidth * 0.9,
      child: CustomTextField(
        labelText: label,
        enabledColor: Colors.white,
        focusColor: MyColor().greyForTextField,
        fillColor: Color.fromARGB(255, 240, 240, 240),
        isPassword: isPassword,
        isEmail: isEmail,
        borderRadius: 12,
        onChanged: onChanged,
      ),
    );
  }

  bool _isEmailValid(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }
}
