import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../help_classes/exports.dart';
import '../../../router/app_router.dart';
import '../../widgets/exports.dart';

@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  double screenWidth = 0.0;
  double screenHeight = 0.0;
  String password = '';
  String email = '';
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColor().greyBackground,
      body: Container(
        height: screenHeight,
        child:
            //Text('yefgushijd')

            Stack(
          children: [
            Positioned(
              child: Image.asset(
                MyVariables.pathToBackGroundBlue,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: screenHeight * 0.25,
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
                          height: screenHeight * 0.05,
                        ),
                        const Text(
                          'Привет!',
                          //MyVariables.strLoginToContinue,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: screenHeight * 0.05,
                        ),
                        buildCustomTextField(
                          label: MyVariables.strEmail,
                          isEmail: true,
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        buildCustomTextField(
                          label: MyVariables.strPassword,
                          isPassword: true,
                          onChanged: (value) {
                            password = value;
                          },
                        ),
                        /* TextButton(
                          onPressed: () {},
                          child: Text(
                            'Забыли пароль?',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: MyColor().mainBlue,
                            ),
                          ),
                        ), */
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.07,
                  ),
                  Container(
                    width: screenWidth * 0.6,
                    child: ElevatedButton(
                      onPressed: () {
                        if (password.length >= 8 && _isEmailValid(email)) {
                          AutoRouter.of(context).replace(AccountRoute());
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Неверно или некоректно введены поля"),
                              duration: Duration(seconds: 3),
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
                        child: Text(
                          MyVariables.strSignIn,
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      AutoRouter.of(context).replace(SignUpRoute());
                    },
                    child: Text(
                      MyVariables.strNoAccountSignUp,
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
              top: screenHeight * 0.2,
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
                    Icons.login_rounded,
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
