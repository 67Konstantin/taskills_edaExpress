import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CurrentBrandScreen extends StatefulWidget{
  @override
  createState() => new CurrentBrandScreenState();
}

class CurrentBrandScreenState extends State<CurrentBrandScreen> with TickerProviderStateMixin{

  int index = 0;

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      appBar: AppBar(title: const Text('Ассортимент')),
      body: Center(
        child: ListView(
          children: [
            Container(
              child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.blueGrey,
                controller: _tabController,
                tabs: [
                  Tab(
                    text: "Выпечка",
                    //icon: Icon(Icons.home),
                  ),
                  Tab(
                    text: "Напитки",
                    //icon: Icon(Icons.account_box),
                  ),
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              height: foodName.length * 60,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    //physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: foodName.length,
                      itemBuilder: (context,index){
                        return  ListTile(
                          title: Text('${foodName[index]}'),
                          leading: Image.asset(foodImages[index], height: 40, width: 40,),
                          subtitle: Text(foodPrice[index]),
                          isThreeLine: true,
                        );
                      }),
                  ListView.builder(
                    //physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: drinkName.length,
                      itemBuilder: (context,index){
                        return  ListTile(
                          title: Text('${drinkName[index]}'),
                          leading: Image.asset(drinkImages[index], height: 40, width: 40,),
                          subtitle: Text(drinkPrice[index]),
                          isThreeLine: true,
                        );
                      })
                ],
              ),
            ),

          ],
        )
      ),
    );
  }
}
