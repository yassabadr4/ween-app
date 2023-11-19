import 'package:flutter/material.dart';
import 'package:ween/features/Home/presentaion/views/widgets/grid_view_body.dart';
import '../../../../../core/componants/colors.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> with TickerProviderStateMixin {
  TabController? controller;
  final categories = [
    'محلات البقالة',
    'مكتبات',
    'صيدليات',
    'محلات الملابس',
    'مطاعم',
    'الكافيهات'
  ];
  List<Widget> getTabs() {
    List<Widget> tabs = [];

    for (int i = 0; i < categories.length; i++) {
      tabs.add(
        Tab(
          text: categories[i],
        ),
      );
    }
    return tabs;
  }

  List<Widget> getViews() {
    List<Widget> views = [];

    for (int i = 0; i < categories.length; i++) {
      views.add(GridViewBody());
    }
    return views;
  }

  @override
  void initState() {
    controller = TabController(length: categories.length, vsync: this);
    controller!.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          TabBar(
            controller: controller,
            indicatorPadding: const EdgeInsets.all(5),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
                color: kPrimary, borderRadius: BorderRadius.circular(13.0)),
            labelStyle: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            labelColor: Colors.white,
            unselectedLabelColor: kPrimary,
            isScrollable: true,
            tabs: getTabs(),
          ),
          Expanded(
            child: SizedBox(
              width: double.maxFinite,
              child: TabBarView(controller: controller, children: getViews()),
            ),
          ),
        ],
      ),
    );
  }
}
