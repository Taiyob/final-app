import 'package:flutter/material.dart';

class CenteredCircularProgressWidget extends StatelessWidget {
  const CenteredCircularProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(),);
  }
}
