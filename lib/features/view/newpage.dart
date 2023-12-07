import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NewPageScreen extends StatefulWidget {
  const NewPageScreen({Key? key}) : super(key: key);

  @override
  State<NewPageScreen> createState() => _NewPageScreenState();
}

class _NewPageScreenState extends State<NewPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Text(
          'guehinj',
        ),
      ),
    );
  }
}
