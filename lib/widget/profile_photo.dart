
import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {
  ProfilePhoto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
              color: Colors.green,
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.red, Colors.purple, Colors.amber]),
              borderRadius: BorderRadius.circular(60)),
        ),
        Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
              border: Border.all(width: 5, color: Colors.white),
              image: const DecorationImage(
                  image:
                      NetworkImage("https://picsum.photos/536/354"),
                  fit: BoxFit.cover),
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(60)),
        ),
      ],
    );
  }
}