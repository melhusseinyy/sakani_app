import 'package:flutter/material.dart';
import 'package:sakni/helper/extention.dart';
import 'package:sakni/widgets/horozintal_card.dart';

class TabBarNew extends StatelessWidget {
  const TabBarNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 26),
      child: Column(
        children: [
          HorozintalCard(),
          16.bh,
          HorozintalCard(),
        ],
      ),
    );
  }
}