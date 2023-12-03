import 'package:flutter/material.dart';

class GenresButtonWidget extends StatelessWidget {
  final String title;
  final Color bgColor;
  const GenresButtonWidget({Key? key,required this.title,required this.bgColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10,bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 17,vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 13),),
    );
  }
}
