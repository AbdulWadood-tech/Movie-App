import 'package:flutter/cupertino.dart';
import 'package:movies_app/views/dashboard/dashboard_screen.dart';
import 'package:movies_app/views/media/media_library_screen.dart';
import 'package:movies_app/views/more/more_screen.dart';

import '../views/watch/movie_list_screen.dart';

class NavigationController extends ChangeNotifier{
  int selectedScreen = 1;
  List screens = [
    DashboardScreen(),
    MovieListScreen(),
    MediaLibraryScreen(),
    MoreScreen(),
  ];

  navigateScreen(int index){
    selectedScreen=index;
    notifyListeners();
  }

}