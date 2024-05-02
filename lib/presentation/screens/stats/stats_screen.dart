import 'package:flutter/material.dart';

import 'widgets/body.dart';
import 'widgets/tab_item.dart';

class StatsScreen extends StatefulWidget {
  static const String routeName = "/stats";

  const StatsScreen({Key? key}) : super(key: key);

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    controller = TabController(
      length: 6,
      vsync: this,
      initialIndex: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Stats',
        ),
        bottom: TabBar(
          controller: controller,
          isScrollable: true,
          indicatorColor: Colors.amber,
          indicatorWeight: 2,
          labelStyle: TextStyle(letterSpacing: 1),
          onTap: (value) {
            print(value);
          },
          tabs: [
            TabItem(title: 'All'),
            TabItem(title: 'Pending'),
            TabItem(title: 'Accepted'),
            TabItem(title: 'Shipped'),
            TabItem(title: 'Delivered'),
            TabItem(title: 'Cancelled'),
          ],
        ),
      ),
      body: Body(controller: controller!),
    );
  }
}
