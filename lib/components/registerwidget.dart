import 'package:flutter/material.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget(
      {super.key, required this.title, this.containerColor, this.onTap});
  final String title;
  final Color? containerColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: containerColor ?? Color(0xff61B1EA),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 140,
            vertical: 14,
          ),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
