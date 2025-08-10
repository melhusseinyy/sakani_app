import 'package:flutter/material.dart';
import 'package:sakni/widgets/horozintal_card.dart';

class RefusedTabBar extends StatelessWidget {
  const RefusedTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 26),
      child: Column(
        children: [
          HorozintalCard(),
        ],
      ),
    );
  }
}