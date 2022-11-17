import 'package:flutter/material.dart';

class InputOutlineButton extends StatelessWidget {
  final String title;
  final Function onClick;
  const InputOutlineButton(
      {Key? key, required this.title, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.white,
        minimumSize: const Size(double.maxFinite, 45),
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(6.0)),
            side: BorderSide(
              color: Theme.of(context).primaryColor,
            )),
      ),
      onPressed: () {
        FocusScope.of(context).requestFocus(FocusNode());
        onClick();
      },
      child: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
    );
  }
}
