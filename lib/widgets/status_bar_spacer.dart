import "package:flutter/material.dart";

class StatusBarSpacer extends StatelessWidget {
  const StatusBarSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).padding.top;

    return SizedBox(
      height: height,
    );
  }
}
