import 'package:flutter/material.dart';

class CircularImageWidget extends StatelessWidget {
  final String url;

  const CircularImageWidget({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: Image.network(url),
      ),
    );
  }
}
