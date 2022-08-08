
import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  InfoItem(this.value, this.title, {Key? key}) : super(key: key);

  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
              fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(title)
      ],
    );
  }
}
