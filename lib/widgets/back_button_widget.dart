import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ()=>Navigator.pop(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 20,),
          SizedBox(width: 20),
          Text('Watch',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),)
        ],
      ),
    );
  }
}
