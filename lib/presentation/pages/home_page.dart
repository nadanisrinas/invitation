import 'package:flutter/material.dart';
import 'package:invitation/presentation/widgets/comment_widget.dart';
import 'package:invitation/presentation/widgets/gallery_widget.dart';
import 'package:invitation/presentation/widgets/header_widget.dart';
import 'package:invitation/presentation/widgets/message_box_widget.dart';
import 'package:invitation/presentation/widgets/message_photo_widget.dart';
import 'package:invitation/presentation/widgets/message_widget.dart';
import 'package:invitation/presentation/widgets/rsvp_widget.dart';
import 'package:invitation/presentation/widgets/subheader_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HeaderWidget(imagePath: 'assets/images/img_header.png', partnerName: 'John & Jane'),
            const SubheaderWidget(),
            const GalleryWidget(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 40, bottom: 40, right: 0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MessageWidget(isRight: false, children: [
                    MessagePhotoWidget(imagePath: 'assets/images/img_women.png'),
                    MessageBoxWidget(isRight: false)
                  ]),
                  MessageWidget(isRight: true, children: [
                    MessageBoxWidget(isRight: true),
                    MessagePhotoWidget(imagePath: 'assets/images/img_women.png')
                  ])
                ],
              ),
            ),
            const RsvpWidget(),
            const CommentSection()
          ],
        ),
      ),
    );
  }
}
