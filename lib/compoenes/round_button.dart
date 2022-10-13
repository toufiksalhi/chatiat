import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  String? buttonText;
  Color? color;
  void Function() onClick;
  RoundButton({Key? key, this.buttonText, this.color, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onClick,
          minWidth: 200.0,
          height: 42.0,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              buttonText!,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
