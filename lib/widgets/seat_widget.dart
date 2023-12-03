import 'package:flutter/material.dart';

class SeatWidget extends StatelessWidget {
  final String title;
  final String icon;
  const SeatWidget({Key? key,required this.title,required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(right: 45),
      child: Row(
        children: [
          Image.asset(icon,height: 20,),
          SizedBox(width: 15),
          Text(title,style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w400),)
        ],
      ),
    );
  }
}
