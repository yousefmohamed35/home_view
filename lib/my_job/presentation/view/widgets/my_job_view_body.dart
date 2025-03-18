import 'package:flutter/material.dart';
import 'package:homeview/my_job/model/tap_bar_model.dart';
import '../../../../core/app_colors.dart';
import 'custom_tap_bar_button.dart';

class MyJobViewBody extends StatefulWidget {
  const MyJobViewBody({super.key});

  @override
  State<MyJobViewBody> createState() => _MyJobViewBodyState();
}

int selectedItem = 0;
List<TapBarModel> tapBar = [
  TapBarModel(text: 'Saved', widget: Center(child: Text('saved'))),
  TapBarModel(text: 'Applied', widget: Center(child: Text('me'))),
  TapBarModel(text: 'last work', widget: Center(child: Text('last'))),
];

class _MyJobViewBodyState extends State<MyJobViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.blue,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            spacing: 10,
            children: List.generate(tapBar.length, (index) {
              return Expanded(
                child: CustomTapBarButton(
                  text: tapBar[index].text,
                  isSelected: index == selectedItem,
                  onPressed: () {
                    selectedItem = index;
                    setState(() {});
                  },
                ),
              );
            }),
          ),
        ),
        tapBar[selectedItem].widget,
      ],
    );
  }
}
