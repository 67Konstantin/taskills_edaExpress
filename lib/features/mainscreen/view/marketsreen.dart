import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taskills_qualification/features/widgets/exports.dart';
import 'package:taskills_qualification/help_classes/exports.dart';

import '../../../router/app_router.dart';

@RoutePage()
class MarketsScreen extends StatefulWidget {
  @override
  createState() => new MarketsScreenState();
}

class MarketsScreenState extends State<MarketsScreen>
    with TickerProviderStateMixin {
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
            decoration: TextDecoration.none,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Open shopping cart',
            onPressed: () {
              AutoRouter.of(context).push(ShopingRoute());
              // handle the press
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              background: SizedBox(
                height: 250,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: MyVariables().restImg.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        String shopName = MyVariables().shops[index];
                        AutoRouter.of(context).push(CurrentBrandRoute(
                          shopName: shopName,
                        ));
                      },
                      child: Container(
                        height: 250,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(MyVariables().restImg[index]),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            bottom: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.blueGrey,
              controller: _tabController,
              tabs: [
                Tab(
                  text: "Рестораны",
                ),
                Tab(
                  text: "Магазины",
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
  controller: _tabController,
  children: [
    CustomCard(
      width: double.infinity,
      height: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: MyVariables().restaurants.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              String shopName = MyVariables().restaurants[index];
              AutoRouter.of(context).push(CurrentBrandRoute(
                shopName: shopName,
              ));
            },
            title: Text('${MyVariables().restaurants[index]}'),
            leading: Image.network(
              MyVariables().restImg[index],
              height: 70,
              width: 70,
            ),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
            isThreeLine: false,
          );
        },
      ),
    ),
    ListView.builder(
        shrinkWrap: true,
        itemCount: MyVariables().shops.length,
        itemBuilder: (context, index) {
          return 
          CustomCard(
      width: double.infinity,
      height: double.infinity,
      child: ListTile(
            onTap: () {
              String shopName = MyVariables().shops[index];
              AutoRouter.of(context).push(CurrentBrandRoute(
                shopName: shopName,
              ));
            },
            title: Text('${MyVariables().shops[index]}'),
            leading: Image.network(MyVariables().shopImg[index]),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
            isThreeLine: false,
          ),);
        },
      ),
  ],
),

          ),
        ],
      ),
    );
  }
}
