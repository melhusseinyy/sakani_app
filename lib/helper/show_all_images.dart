import 'package:flutter/material.dart';

class ShowAllImagesPage extends StatelessWidget {
  final List<String> allImages;

  const ShowAllImagesPage({super.key, required this.allImages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: allImages.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(allImages[index], fit: BoxFit.cover),
          );
        },
      ),
    );
  }
}
