import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;
  const NavigationButton({Key? key,required this.title,required this.icon,required this.onTap,required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/${icon}',height: 20,color:isSelected?Colors.white: Colors.grey,),
          SizedBox(height: 10),
          Text(title,style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: Colors.grey),)
        ],
      ),
    );
  }
}
