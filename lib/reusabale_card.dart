import 'package:flutter/material.dart';

const bottomcontainercolour = Color(0xFF1D1E33);

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour,this.cardchild});
  final Color colour;
  final Widget cardchild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardchild,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.all(15.0),
    );
  }
}
