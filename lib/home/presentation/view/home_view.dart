import 'package:flutter/material.dart';
import 'widgets/custom_floating_action_button.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: HomeViewBody(),
    );
  }
}
