import 'package:flutter/material.dart';
import 'package:movies_app/controllers/navigation_controller.dart';
import 'package:movies_app/utils/colors.dart';
import 'package:movies_app/widgets/navigation_button.dart';
import 'package:provider/provider.dart';


class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationController>(builder: (context,navigation,child){
      return Scaffold(
        body: navigation.screens[navigation.selectedScreen],
        bottomNavigationBar: Container(
          width: double.infinity,
          height:90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
            color: AppColors.primaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavigationButton(title: 'Dashboard', icon: 'dashboard.png',onTap:()=> navigation.navigateScreen(0),isSelected: navigation.selectedScreen==0,),
              NavigationButton(title: 'Watch', icon: 'watch.png',onTap:()=> navigation.navigateScreen(1),isSelected: navigation.selectedScreen==1,),
              NavigationButton(title: 'Media Library', icon: 'media.png',onTap:()=> navigation.navigateScreen(2),isSelected: navigation.selectedScreen==2,),
              NavigationButton(title: 'More', icon: 'more.png',onTap:()=> navigation.navigateScreen(3),isSelected: navigation.selectedScreen==3,),
            ],
          ),
        ),
      );
    });
  }
}
