import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../entities/food_entity.dart';
import 'widgets/food_item_widget.dart';
import 'widgets/tab_bar_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Obx(() => FoodListsWidget(entities: controller.entities.value)),
      ),
    );
  }
}

class FoodListsWidget extends StatefulWidget {
  const FoodListsWidget({
    Key? key,
    required this.entities,
  }) : super(key: key);

  final List<FoodEntity> entities;

  @override
  State<FoodListsWidget> createState() => _FoodListsWidgetState();
}

class _FoodListsWidgetState extends State<FoodListsWidget> {
  final ValueNotifier<int> _selectedPage = ValueNotifier(0);

  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    final favourites =
        widget.entities.where((element) => element.favourites).toList();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ValueListenableBuilder<int>(
          valueListenable: _selectedPage,
          builder: (context, page, _) => TabBarWidget(
            selectedPage: page,
            onTap: _pageOnTap,
          ),
        ),
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: [
              _FoodListPage(pageKey: 'home', entities: widget.entities),
              _FoodListPage(pageKey: 'favourites', entities: favourites),
            ],
          ),
        ),
      ],
    );
  }

  void _onPageChanged(int id) => _selectedPage.value = id;

  void _pageOnTap(int index) => _pageController.animateToPage(
        index,
        duration: kThemeAnimationDuration,
        curve: Curves.ease,
      );
}

class _FoodListPage extends StatelessWidget {
  const _FoodListPage({
    Key? key,
    required this.pageKey,
    required this.entities,
  }) : super(key: key);

  final String pageKey;
  final List<FoodEntity> entities;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: PageStorageKey<String>(pageKey),
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        child: Column(
          children: List.generate(
            entities.length,
            (index) => FoodItemWidget(entities[index]),
          ),
        ),
      ),
    );
  }
}
