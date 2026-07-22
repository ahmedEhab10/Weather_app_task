import 'package:flutter/material.dart';

class InformationContinar extends StatelessWidget {
  const InformationContinar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 350,

      padding: const EdgeInsets.all(24),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color.fromARGB(255, 235, 233, 233),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: const Color(0x19C3C6D7)),
          borderRadius: BorderRadius.circular(24),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 20,
            offset: Offset(0, 8),
            spreadRadius: 0,
          ),
        ],
      ),
    );
  }
}
