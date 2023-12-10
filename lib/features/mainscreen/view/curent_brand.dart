import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taskills_qualification/help_classes/exports.dart';


import '../../../help_classes/exports.dart';
import '../../../router/app_router.dart';

@RoutePage()
class CurrentBrandScreen extends StatefulWidget {
  final String shopName;

  CurrentBrandScreen({required this.shopName});

  @override
  createState() => new CurrentBrandScreenState();
}

class CurrentBrandScreenState extends State<CurrentBrandScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.shopName} Ассортимент')),
      body: Center(
        child: Column(
          children: [
            Container(
              child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.blueGrey,
                controller: _tabController,
                tabs: [
                  Tab(
                    text: "Выпечка",
                  ),
                  Tab(
                    text: "Напитки",
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildItemList(MyVariables().shopItemsMap[widget.shopName]?["foodNames"] ?? []),
                  _buildItemList(MyVariables().shopItemsMap[widget.shopName]?["drinkNames"] ?? []),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemList(List<String> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
          leading: Image.asset(
            _getImage(widget.shopName, index),
            height: 40,
            width: 40,
          ),
          subtitle: Text(_getPrice(widget.shopName, index)),
          isThreeLine: true,
          trailing: ButtonTheme(
                      minWidth: 20.0,
                      height: 20.0,
                      child: ElevatedButton(
                        onPressed: () => {
                        MyVariables.basketName.add([items[index], 
                          widget.shopName]),
                        MyVariables.basketPrice.add(_getPrice(
                          widget.shopName, index)),
                        MyVariables.basketAllPrice += int.parse(_getPrice(
                          widget.shopName, index).split(" ")[0]),
                      },
                      child: Icon(Icons.add),
                      ),
                    ),
        );
      },
    );
  }

  String _getImage(String shopName, int index) {
    String type = _tabController?.index == 0 ? "food" : "drink";
    return MyVariables().shopItemsMap[widget.shopName]?["${type}Images"]?[index] ??
        MyVariables().defaultFoodImage;
  }

  String _getPrice(String shopName, int index) {
    String type = _tabController?.index == 0 ? "food" : "drink";
    return MyVariables().shopItemsMap[widget.shopName]?["${type}Prices"]?[index] ??
        MyVariables().defaultFoodPrice;
  }
}
