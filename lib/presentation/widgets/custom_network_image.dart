import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final BoxFit? boxFit;

  const CustomNetworkImage(
      {required this.image, this.height, this.width, this.boxFit, super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      // color: Colors.amberAccent,
      image,
      height: height,
      width: width,
      fit: boxFit,
      errorBuilder: (_, __, ___) => const Icon(Icons.error, color: Colors.red),
    );
  }
}
