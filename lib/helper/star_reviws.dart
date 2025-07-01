import 'package:flutter/material.dart';

class StarReviws extends StatefulWidget {
  const StarReviws({super.key, this.color=const Color(0xffEDA145), required this.onRatingChange,  this.starcount=5, this.initialRating=0.0, this.starSize=13});
 final int starcount ;
 final double starSize;
 final double initialRating;
 final Color color;
 final void Function(double) onRatingChange;
  @override
  State<StarReviws> createState() => _StarReviwsState();
}

class _StarReviwsState extends State<StarReviws> {
  late double _currentRating;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentRating=widget.initialRating;
  }
  void _handleTab(int index){
    setState(() {
      _currentRating=index+1;
    });
    widget.onRatingChange(_currentRating);

  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(widget.starcount, (index) {
        IconData icon;
        if (index < _currentRating.floor()) {
          icon = Icons.star;
        } else {
          icon = Icons.star_border;
        }
        return GestureDetector(
          onTap: () => _handleTab(index),
          child: Icon(icon, color: widget.color, size: widget.starSize),
        );
      }),
    );
  }
}