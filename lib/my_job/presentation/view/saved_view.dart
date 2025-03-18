import 'package:flutter/material.dart';
import 'package:homeview/home/presentation/view/widgets/home_view_item.dart';

class SavedView extends StatelessWidget {
  const SavedView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          spacing: 16,
          children: List.generate(3, (index) {
            return HomeViewItem();
          }),
        ),
      ),
    );
  }
}
