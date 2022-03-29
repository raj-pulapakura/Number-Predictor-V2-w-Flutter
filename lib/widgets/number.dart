import "package:flutter/material.dart";

class Number extends StatelessWidget {
  final int number;
  final double? fontSize;
  final double? padding;

  const Number({
    Key? key,
    required this.number,
    this.fontSize,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding ?? 0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColor,
      ),
      child: Center(
        child: Text(
          number.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize ?? 20,
          ),
        ),
      ),
    );
  }
}
