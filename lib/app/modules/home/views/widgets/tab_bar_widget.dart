import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

const List<String> _pageTitles = ['Home', 'Favourite'];

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    Key? key,
    required this.selectedPage,
    required this.onTap,
  }) : super(key: key);

  final int selectedPage;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          _pageTitles.length,
          (index) => _TabItem(
            title: _pageTitles[index],
            selected: selectedPage == index,
            onTap: () => onTap(index),
          ),
        ),
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  const _TabItem({
    Key? key,
    required this.title,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minWidth: 100.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: selected ? AppColors.accent : AppColors.grey,
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
