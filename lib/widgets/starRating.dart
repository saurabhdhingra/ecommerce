import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double size;
  final int starCount;
  final double rating;

  // ignore: use_key_in_widget_constructors
  const StarRating({
    this.starCount = 5,
    this.rating = .0,
    this.size = 24.0,
  });

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(Icons.star, color: Colors.grey, size: size);
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(Icons.star_half, color: Colors.yellow[600], size: size);
    } else {
      icon = Icon(Icons.star, color: Colors.yellow[600], size: size);
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children:
            List.generate(starCount, (index) => buildStar(context, index)));
  }
}
