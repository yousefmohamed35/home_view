import 'package:flutter/material.dart';

import 'last_work_view_item.dart';

class LastWorkViewBody extends StatelessWidget {
  const LastWorkViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: List.generate(5, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: LastWorkViewItem(),
            );
          }),
        ),
      ),
    );
  }
}
