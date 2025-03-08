import 'package:flutter/material.dart';

class CustomContainerAppBar extends StatelessWidget {
  const CustomContainerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff2B5B8D),
      height: 153,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Hello, Karim',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xffF9F6EE),
            ),
          ),
          Icon(Icons.notifications_outlined, color: Color(0xffF9F6EE)),
        ],
      ),
    );
  }
}
