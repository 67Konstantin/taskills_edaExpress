import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taskills_qualification/help_classes/exports.dart';


import '../../../help_classes/exports.dart';
import '../../../router/app_router.dart';

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
              height: MyVariables().foodName.length * 60,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    //physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: MyVariables().foodName.length,
                      itemBuilder: (context,index){
                        return  ListTile(
                          title: Text('${MyVariables().foodName[index]}'),
                          leading: Image.asset(MyVariables().foodImages[index], height: 40, width: 40,),
                          subtitle: Text(MyVariables().foodPrice[index]),
                          isThreeLine: true,
                          onTap: (){
                                  MyVariables().basketName.add(MyVariables().foodName);
                                  MyVariables().basketPrice.add(MyVariables().foodPrice);
                                  AutoRouter.of(context).push(ShopingRoute());
                                },
                        );
                      }),
                  ListView.builder(
                    //physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: MyVariables().drinkName.length,
                      itemBuilder: (context,index){
                        return  ListTile(
                          title: Text('${MyVariables().drinkName[index]}'),
                          leading: Image.asset(MyVariables().drinkImages[index], height: 40, width: 40,),
                          subtitle: Text(MyVariables().drinkPrice[index]),
                          isThreeLine: true,
                          onTap: (){
                                  MyVariables().basketName.add(MyVariables().drinkName);
                                  MyVariables().basketPrice.add(MyVariables().drinkPrice);
                                  AutoRouter.of(context).push(ShopingRoute());
                                },
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
