import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ShopingScreen extends StatefulWidget {
  const ShopingScreen({Key? key}) : super(key: key);

  @override
  State<ShopingScreen> createState() => _ShopingScreenState();
}

class _ShopingScreenState extends State<ShopingScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amber,
      body: Text('Привет'),
    );
  }
}
