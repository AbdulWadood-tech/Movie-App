import 'package:flutter/material.dart';
class CustomButtonWidget extends StatelessWidget {
  final String title;
  final Color? filledColor;
  final Color? borderColor;
  final VoidCallback onTap;
  final Icon? prefixIcon;
  const CustomButtonWidget({Key? key,required this.onTap,required this.title, this.filledColor, this.borderColor, this.prefixIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor??Colors.transparent,width: 2),
          color: filledColor??Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixIcon!=null?Padding(
              padding: const EdgeInsets.only(right: 10),
              child: prefixIcon!,
            ):SizedBox(),
            Text(title,style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w700),),
          ],
        ),
      ),
    );
  }
}
