import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taskills_qualification/router/app_router.dart';

@RoutePage()
class MarketsScreen extends StatefulWidget {
  @override
  createState() => new MarketsScreenState();
}

class MarketsScreenState extends State<MarketsScreen>
    with TickerProviderStateMixin {
  final List _array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      appBar: AppBar(
        title: Text("ЕдаExpress",
            style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                decoration: TextDecoration.none)),
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
                        itemBuilder: (_, index) {
                          return Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/png/2.jpg"),
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
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {
                                  AutoRouter.of(context)
                                      .push(CurrentBrandRoute());
                                },
                                title: Text('${_array[index]}'),
                                leading: Image.asset("assets/png/2.jpg"),
                                subtitle: Text('Ресторан'),
                                trailing: Icon(
                                  Icons.arrow_forward_ios_sharp,
                                ),
                                isThreeLine: true,
                              );
                            }),
                        ListView.builder(
                            //physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _array.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {
                                  AutoRouter.of(context)
                                      .push(CurrentBrandRoute());
                                },
                                title: Text('${_array[index]}'),
                                leading: Image.asset("assets/png/2.jpg"),
                                subtitle: Text('Магазин'),
                                trailing: Icon(
                                  Icons.arrow_forward_ios_sharp,
                                ),
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
