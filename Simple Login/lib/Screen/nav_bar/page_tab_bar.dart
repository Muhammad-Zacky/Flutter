import 'package:flutter/material.dart';
import 'package:pertemuan_pertama/Screen/nav_bar/page_grid_view.dart';
import 'package:pertemuan_pertama/Screen/nav_bar/page_register.dart';
import 'package:pertemuan_pertama/Screen/nav_bar/page_list_view.dart';


class  PageTabBar extends StatefulWidget {
  const PageTabBar ({super.key});

  @override
  State<PageTabBar> createState() => _PageTabBarState();
}

class _PageTabBarState extends State<PageTabBar> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,title: Text("Nav Bar", style: TextStyle(color: Colors.white)),
      ),
      body: TabBarView(controller: tabController, children: [PageRegister(), PageGridView(), PageListView()]),
      bottomNavigationBar: BottomAppBar(
        child: TabBar(controller: tabController,tabs: [
          Tab(text: 'Form Register',icon: Icon(Icons.input),),
          Tab(text: 'Grid View',icon: Icon(Icons.grid_on),),
          Tab(text: 'List View',icon: Icon(Icons.list),),
        ]),
     ),
);
}
}