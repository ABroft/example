import 'package:flutter/material.dart';

class ShadowBox extends StatelessWidget {
  const ShadowBox({Key? key, required this.width}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(0.5, 0),
            end: Alignment.centerRight,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).shadowColor
            ],
          ),
          border: Border.all(
            width: 0,
            color: Theme.of(context).backgroundColor,
          ),
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5, // soften the shadow
              spreadRadius: 0.1, //extend the shadow
              offset: Offset(
                1.0,
                1.0,
              ),
            )
          ]),
      margin: const EdgeInsets.only(
        left: 20,
        top: 30,
      ),
      child: SizedBox(
        height: 40,
        width: width,
      ),
    );
  }
}
