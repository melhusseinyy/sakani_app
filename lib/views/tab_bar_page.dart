import 'package:flutter/material.dart';
class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedTab = 'جديدة';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    selectedTab = 'جديدة';

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;

      setState(() {
        if (_tabController.index == 0) {
          selectedTab = 'جديدة';
        } else if (_tabController.index == 1) selectedTab = 'حالية';
        else if (_tabController.index == 2) selectedTab = 'مرفوضة';
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('وحداتى')),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              TabBar(
                controller: _tabController,
                labelColor: Color(0xff008080),
                unselectedLabelColor: Color(0xff9CA2AC),
                indicatorColor: Color(0xff008080),
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 2.0, color: Color(0xff008080)),
                  insets: EdgeInsets.symmetric(horizontal: 94.0),
                ),
                tabs: [
                  Tab(text: 'جديدة'),
                  Tab(text: 'حالية'),
                  Tab(text: 'مرفوضة'),
                ],
              ),

              /// هذا هو الـ Container اللي بيتحرك حسب selectedTab
              AnimatedAlign(
                alignment: _getAlignmentFromTab(),
                duration: Duration(milliseconds: 300),
                child: Container(
                  margin: EdgeInsets.only(bottom: 4),
                  width: 52,
                  height: 2,
                  color: Colors.teal,
                ),
              ),
            ],
          ),

          /// هنا المحتوى حسب التاب
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(child: Text('محتوى جديدة')),
                Center(child: Text('محتوى حالية')),
                Center(child: Text('محتوى مرفوضة')),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// يحول قيمة selectedTab إلى موضع الContainer
  Alignment _getAlignmentFromTab() {
    switch (selectedTab) {
      case 'جديدة':
        return Alignment(1.0, 1.0); // أقصى اليمين
      case 'حالية':
        return Alignment(0.0, 1.0);  // في النص
      case 'مرفوضة':
        return Alignment(-1.0, 1.0);  // أقصى اليسار
      default:
        return Alignment(-1.0, 1.0);
    }
  }
}
