import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.name, required this.onPressed})
      : super(key: key);
  final String name;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            name,
            style: const TextStyle(fontSize: 20),
          )),
    );
  }
}
