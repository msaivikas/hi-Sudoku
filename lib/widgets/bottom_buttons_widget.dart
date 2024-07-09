import 'package:flutter/material.dart';

class BottomButtonsWidget extends StatelessWidget {
  const BottomButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.home_rounded,
                color: Color(0xff27187e),
                size: 40.0,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.message_rounded,
                color: Color(0xff27187e),
                size: 40.0,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
