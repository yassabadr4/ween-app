import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ween/core/componants/assets.dart';
import 'package:ween/core/componants/buttons/circle_button.dart';
import 'package:ween/core/function/app_router.dart';
import 'package:ween/features/Home/presentaion/views/widgets/new_offers_list_view.dart';
import 'package:ween/features/Home/presentaion/views/widgets/tabbar.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final images = [
    'https://www.shutterstock.com/image-vector/sale-banner-template-design-geometric-260nw-1988294282.jpg',
    'https://img.freepik.com/free-vector/hand-drawn-flat-black-friday-horizontal-sale-banner_23-2149101019.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLiXtr51ABAICp1RoBIHfFt7cMSSOZng9OzOMMr1gFEjY7sREdzuJQkyrwBTpVjxCL5w8&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNQWWphPq9iSSyrnjG97KG7xkpD3akT_1Zsy5u0HN8tVfF22xRhCPiyc6WDVAqj3Tm-XY&usqp=CAU',
    'https://www.shutterstock.com/image-vector/summer-sale-template-banner-vector-260nw-656471581.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.width * 0.64,
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    width: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: Row(
                        children: [
                          Image.asset(AssetsData.logo),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: CircleButton(
                              icon: Icons.search,
                              onPressed: () {
                                GoRouter.of(context)
                                    .push(AppRouter.kSearchView);
                              },
                            ),
                          ),
                          CircleButton(
                            icon: Icons.settings,
                            onPressed: () {
                              GoRouter.of(context).push(AppRouter.kSettingView);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: NewOfferListView(
                      images: images,
                    ),
                  ),
                ],
              ),
            ),
          )
        ];
      },
      body: const Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Tabbar(),
        ],
      ),
    )));
  }
}
