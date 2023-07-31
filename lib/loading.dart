import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 158, 148, 239),
      child: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 175,
        ),
      ),
    );
  }
}
