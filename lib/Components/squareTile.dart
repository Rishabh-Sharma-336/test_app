import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imageurl;
  final double height;
  const SquareTile({super.key,
  required this.imageurl,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade600),
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade300,
      ),
      child: Image.asset(
        imageurl,
        height: this.height,
      ),
    );
  }
}
