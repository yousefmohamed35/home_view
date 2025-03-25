import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class CustomStepCircle extends StatelessWidget {
  const CustomStepCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 19,
      backgroundColor: Color(0xff0D9300),
      child: CircleAvatar(
        radius: 17,
        backgroundColor: AppColors.white,
        child: CircleAvatar(
          radius: 15,
          backgroundColor: Color(0xff0D9300),
          child: Icon(Icons.check, color: AppColors.white, size: 15),
        ),
      ),
    );
  }
}
