import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class GalleryWidget extends StatelessWidget {
  const GalleryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        // Set the width of the container
        width: double.infinity,
        child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 16 / 9, // Adjust aspect ratio as needed
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            autoPlay: true,
          ),
          items: [
            // Replace these AssetImage widgets with your own image widgets
            const AssetImage('assets/images/img_gallery.png'),
            const AssetImage('assets/images/img_header.png'),
          ].map((imageProvider) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: double.infinity, // Set image width to 100%
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
