import 'package:flutter/material.dart';

import 'company_review_item_list_view.dart';
import 'company_review_title.dart';
import 'custom_container_app_bar.dart';
import 'home_view_item.dart';
import 'search_items.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              CustomContainerAppBar(),
              SizedBox(height: 60),
              HomeViewItem(),
              SizedBox(height: 20),
              CompanyReviewTitle(),
              SizedBox(height: 20),
              CompanyReviewItemListView(),
              SizedBox(height: 20),
              HomeViewItem(),
            ],
          ),
          Positioned(top: 100, left: 20, right: 20, child: SearchItems()),
        ],
      ),
    );
  }
}
