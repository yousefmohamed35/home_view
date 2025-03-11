import 'package:flutter/material.dart';
import 'widgets/company_review_title.dart';
import 'widgets/custom_container_app_bar.dart';
import 'widgets/custom_floating_action_button.dart';
import 'widgets/home_view_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomContainerAppBar(),
            SizedBox(height: 60),
            HomeViewItem(),
            SizedBox(height: 20),
            CompanyReviewTitle(),
          ],
        ),
      ),
    );
  }
}

