import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final void Function()? onSubmit;
  final String text;
  const SubmitButton({Key? key, required this.onSubmit, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 90),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(150, 40),
          foregroundColor: Colors.white,
          backgroundColor: Color.fromRGBO(12, 62, 117, 1), // text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // rounded corners
          ),
        ),
        onPressed: onSubmit,
        child: Text(text),
      ),
    );
  }
}
