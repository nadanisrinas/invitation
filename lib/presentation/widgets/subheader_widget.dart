import 'package:flutter/material.dart';
import 'package:invitation/presentation/widgets/wedding_detail_item.dart';

class SubheaderWidget extends StatelessWidget {
  const SubheaderWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200], // Background color of subheader
      child: Padding(
        padding: const EdgeInsets.only(top: 40, bottom: 40), // Add margin to the top
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8, // Adjust width as needed
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFFEDFE3),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8, // Adjust width as needed
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFFBB9096),
                  width: 2.0,
                ),
              ),
              child: Center(
                child: Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
                  Positioned(
                    top: -70,
                    child: Image.asset(
                      'assets/images/img_subheader_flower.png', // Path to flower image
                      height: 50,
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'Wedding Ceremony',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      WeddingDetailItem(
                        label: 'Name:',
                        value: 'John & Jane', // Example partner names
                      ),
                      WeddingDetailItem(
                        label: 'Date:',
                        value: 'June 1, 2024', // Example date
                      ),
                      WeddingDetailItem(
                        label: 'Time:',
                        value: '3:00 PM', // Example time
                      ),
                      WeddingDetailItem(
                        label: 'Place:',
                        value: 'The Grand Ballroom', // Example place
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
