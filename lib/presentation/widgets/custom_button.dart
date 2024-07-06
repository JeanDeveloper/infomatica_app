import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final VoidCallback? ontap;
  final Widget child;
  final EdgeInsets padding;

  const CustomButton({
    super.key, 
    this.ontap, 
    required this.child,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(

        decoration: BoxDecoration(
          color: Color(0xff294466),
          borderRadius: BorderRadius.circular(10)
        ),

        child: Padding(
          padding: padding,
          child: child,
        ),


      ),
    );
  }
}