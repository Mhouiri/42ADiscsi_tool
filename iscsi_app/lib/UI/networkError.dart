import 'package:flutter/material.dart';

class NetworkError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Make sure you're connected in campus's network"),
      ),
    );
  }
}