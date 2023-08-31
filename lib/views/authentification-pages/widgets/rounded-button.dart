import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({Key? key, required this.buttonName, required this.color})
      : super(key: key);

  final String buttonName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
  
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
      child: TextButton(
        onPressed: null,
        child: Text(
          buttonName,
          style: TextStyle(
              color: color == Colors.white ? Colors.blue : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
    );
  }
}
