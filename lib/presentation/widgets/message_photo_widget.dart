import 'package:flutter/material.dart';

class MessagePhotoWidget extends StatelessWidget {
  final String imagePath;
  const MessagePhotoWidget({super.key, required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 100, // Height of the image container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage(imagePath), // Path to the local image asset
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
