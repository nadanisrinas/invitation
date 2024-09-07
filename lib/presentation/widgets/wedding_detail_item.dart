import 'package:flutter/material.dart';

class WeddingDetailItem extends StatelessWidget {
  final String label;
  final String value;

  const WeddingDetailItem({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 5),
        Text(value),
      ],
    );
  }
}
