import "package:flutter/material.dart";

enum ButtonColor {
  primary,
  secondary,
}

class Button extends StatelessWidget {
  final String text;
  final ButtonColor? buttonColor;
  final VoidCallback? onPressed;

  const Button({
    Key? key,
    required this.text,
    this.buttonColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(10),
        ),
        backgroundColor: MaterialStateProperty.all(
          (buttonColor == false || buttonColor == ButtonColor.primary)
              ? Theme.of(context).primaryColor
              : const Color.fromARGB(225, 73, 73, 73),
        ),
      ),
    );
  }
}
