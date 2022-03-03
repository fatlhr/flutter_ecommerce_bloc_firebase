import 'package:flutter/material.dart';

import '../config/theme.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({
    Key? key, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title,
          style: textTheme().headline3,
        ),
      ),
    );
  }
}