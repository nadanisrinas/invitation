import 'package:flutter/material.dart';
import 'package:invitation/presentation/widgets/message_widget.dart';
import 'package:invitation/presentation/widgets/mirror_widget.dart';

class MessageBoxWidget extends StatelessWidget {
  final bool isRight;
  const MessageBoxWidget({super.key, required this.isRight});
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 120,
          margin: const EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.only(bottom: 50, top: 50, left: isRight ? 10 : 0),
          decoration: BoxDecoration(
            color: const Color(0xFFFEDFE3), // Pink box color
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(isRight ? 0 : 8),
              bottomRight: Radius.circular(isRight ? 0 : 8),
              topLeft: Radius.circular(isRight ? 8 : 0),
              bottomLeft: Radius.circular(isRight ? 8 : 0),
            ),
          ),
          child: const Center(
            child: Text(
              'This is the message text. It can span multiple lines and provides detailed information.',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
        Positioned(
          left: isRight ? MediaQuery.of(context).size.width - 250 : 0,
          top: 10,
          child: MirrorWidget(
            horizontal: isRight ? true : false,
            child: TrapezoidBox(
              width: 160,
              height: 30,
              color: const Color(0xFFC39AA0),
              shadowColor: Colors.black45,
              shadowOffset: const Offset(4, 4),
              shadowBlurRadius: 10,
              child: Container(
                padding: const EdgeInsets.only(left: 5, top: 5),
                child: MirrorWidget(
                  horizontal: isRight ? true : false,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Hello Trapezoid',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
