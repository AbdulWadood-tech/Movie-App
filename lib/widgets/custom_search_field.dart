import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final dynamic onChanged;
  final VoidCallback onCancel;
  const CustomSearchField({Key? key,required this.onChanged,required this.onCancel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: Color(0xffF2F2F6),
            borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          children: [
            Icon(Icons.search),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                onChanged: onChanged,
                decoration: InputDecoration(
                    hintText: 'TV shows, movies and more',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none
                ),
              ),
            ),
            SizedBox(width: 10,),
            InkWell(
                onTap: onCancel,
                child: Icon(Icons.clear)),
          ],
        ),
      ),
    );
  }
}
