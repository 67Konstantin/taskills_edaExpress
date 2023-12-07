import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../help_classes/exports.dart';

@RoutePage()
class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  double screenWidth = 0.0;
  double screenHeight = 0.0;
  @override
  Widget build(BuildContext context) {
    
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Container(
        child: Icon(
          Icons.settings,
          color: Colors.white,
          size: screenWidth * 0.5,
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
