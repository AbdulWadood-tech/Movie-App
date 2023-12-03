import 'package:flutter/material.dart';

 customLoader(BuildContext context){
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: Colors.black.withOpacity(0.0),
        content: Container(
          height: 50,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: Colors.white,),
              ],
            )),
      );
    },
  );
}