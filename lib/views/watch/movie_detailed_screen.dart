import 'package:flutter/material.dart';
import 'package:movies_app/views/watch/details.dart';
import 'package:movies_app/views/watch/header.dart';
import 'package:provider/provider.dart';

import '../../controllers/movies_controller.dart';

class MovieDetailedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesController>(builder: (context,movieDetails,child){
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(movieDetailsModel: movieDetails.selectedMovieDetailsModel!),
              Padding(
               padding:EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width*0.1),
                child: Details(movieDetailsModel: movieDetails.selectedMovieDetailsModel!),
              ),
            ],
          ),
        ),
      );
    });
  }
}
