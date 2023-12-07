import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CurrentBrandScreen extends StatefulWidget{
  @override
  createState() => new CurrentBrandScreenState();
}

class CurrentBrandScreenState extends State<CurrentBrandScreen> with TickerProviderStateMixin{

  final List _array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
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
              height: _array.length * 60,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    //physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _array.length,
                      itemBuilder: (context,index){
                        return  ListTile(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CurrentBrandScreen()));
                          },
                          title: Text('${_array[index]}'),
                          leading: Image.asset("assets/png/2.jpg"),
                          subtitle: Text('Выпечка'),
                          isThreeLine: true,
                        );
                      }),
                  ListView.builder(
                    //physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _array.length,
                      itemBuilder: (context,index){
                        return  ListTile(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CurrentBrandScreen()));
                          },
                          title: Text('${_array[index]}'),
                          leading: Image.asset("assets/png/2.jpg"),
                          subtitle: Text('Напиток'),
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