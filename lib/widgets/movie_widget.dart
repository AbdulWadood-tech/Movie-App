import 'package:flutter/material.dart';
import 'package:movies_app/controllers/movies_controller.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/views/watch/movie_detailed_screen.dart';
import 'package:movies_app/widgets/custom_loader.dart';
import 'package:provider/provider.dart';

class MovieWidget extends StatelessWidget {
  final MovieModel movieModel;
  const MovieWidget({Key? key,required this.movieModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
        customLoader(context);
        await Provider.of<MoviesController>(context,listen: false).getMovieDetails(movieModel.id);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
          return MovieDetailedScreen();
        }));
      },
      child: Container(
        margin: EdgeInsets.only(top: 25),
        padding: EdgeInsets.all(15),
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(MoviesController.buildPosterUrl(movieModel.posterPath)),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10)
        ),
        alignment: Alignment.bottomLeft,
        child: Text(movieModel.title,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
      ),
    );
  }

}
