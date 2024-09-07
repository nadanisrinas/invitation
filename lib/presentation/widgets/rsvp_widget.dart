import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RsvpWidget extends StatefulWidget {
  const RsvpWidget({super.key});

  @override
  State<RsvpWidget> createState() => _RsvpWidgetState();
}

class _RsvpWidgetState extends State<RsvpWidget> {
  TextEditingController guestNameController = TextEditingController();
  TextEditingController partnerNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      width: 300,
      decoration: BoxDecoration(
        color: const Color(0xFFFEDFE3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Married Couple Name',
            style: TextStyle(
              color: Color(0xFF965A00),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset(
            'assets/images/img_subheader_flower.png', // Replace 'assets/flower_image.png' with your actual image path
            width: 100,
            height: 100,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: const Text(
              'We Look forward for your Attendance',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Guest Name '),
                buildTextFieldWithLabel('Guest Name'),
                const SizedBox(height: 10),
                const Text('Partner Name'),
                buildTextFieldWithLabel('Partner Name'),
                const SizedBox(height: 10),
                const Text('Email'),
                buildTextFieldWithLabel('Email'),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: (MediaQuery.of(context).size.width / 2) - 60,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Sorry'),
                ),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width / 2) - 60,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Attending'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTextFieldWithLabel(String labelText) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        TextField(
          controller: labelText == 'Guest Name'
              ? guestNameController
              : labelText == 'Partner Name'
                  ? partnerNameController
                  : emailController,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF787885))),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 8),
          child: Text(
            labelText,
            style: const TextStyle(color: Color(0xFF787885)),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    guestNameController.dispose();
    partnerNameController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
