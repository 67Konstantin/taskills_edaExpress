import 'package:flutter/material.dart';


void main() =>  runApp(
    new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
            body: new Center(
              child: new MyBody(),
            )
        )
    )
);

class MyBody extends StatefulWidget {
  @override
  createState() => new MyBodyState();
}

class MyBodyState extends State<MyBody> with TickerProviderStateMixin{

  final List _array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int index = 0;



  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "ЕдаExpress",
            style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                decoration: TextDecoration.none
            )
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: ListView(
          //padding: EdgeInsets.all(32),
          children: [
            SingleChildScrollView(
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                      child: SizedBox(
                        height: 200,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index){
                            return Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/2.jpg"),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                  ),
                  Container(
                    child: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.blueGrey,
                      controller: _tabController,
                      tabs: [
                        Tab(
                          text: "Рестораны",
                          //icon: Icon(Icons.home),
                        ),
                        Tab(
                          text: "Магазины",
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
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder:
                                          (context) => CurrentBrand()));
                                },
                                title: Text('${_array[index]}'),
                                leading: Image.asset("assets/images/2.jpg"),
                                subtitle: Text('Ресторан'),
                                trailing: Icon(Icons.arrow_forward_ios_sharp,),
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
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CurrentBrand()));
                                },
                                title: Text('${_array[index]}'),
                                leading: Image.asset("assets/images/2.jpg"),
                                subtitle: Text('Магазин'),
                                trailing: Icon(Icons.arrow_forward_ios_sharp,),
                                isThreeLine: true,
                              );
                            })
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CurrentBrand extends StatefulWidget{
  @override
  createState() => new CurrentBrandState();
}

class CurrentBrandState extends State<CurrentBrand> with TickerProviderStateMixin{

  final List foodName = ["Ватрушка", "Слойка с вишней", "Сосика в тесте",
                       "Паровка", "Пицца", "Беляш", "Пирожок с картошкой"];
  final List foodImages = ["assets/images/vatrushka.jpg", "assets/images/cherry.jpg",
                          "assets/images/sausage.jpg", "assets/images/steam.jpg",
                          "assets/images/pizza.jpg", "assets/images/belyash.jpg",
                          "assets/images/pie.jpg"];
  final List foodPrice = ["60 руб", "60 руб", "65 руб", "85 руб", "87 руб", "70 руб", "55 руб"];

  final List drinkName = ["Чай чёрный", "Морс клюквенный", "Чай зелёный"];
  final List drinkImages = ["assets/images/teaBlack.jpg", "assets/images/morse.jpg", 
                            "assets/images/teaGreen.jpg"];
  final List drinkPrice = ["30 руб", "70 руб", "35 руб"];
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
