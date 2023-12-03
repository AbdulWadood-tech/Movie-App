import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:provider/provider.dart';
import '../controllers/movies_controller.dart';
import '../utils/colors.dart';
import '../views/watch/movie_detailed_screen.dart';
import 'custom_loader.dart';

class SearchedMovieWidget extends StatelessWidget {
  final MovieModel movieModel;
  const SearchedMovieWidget({Key? key,required this.movieModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()async{
        customLoader(context);
        await Provider.of<MoviesController>(context,listen: false).getMovieDetails(movieModel.id);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
          return MovieDetailedScreen();
        }));
      },
      child: Container(
        margin: EdgeInsets.only(top: 15),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image:NetworkImage(MoviesController.buildPosterUrl(movieModel.posterPath)),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10)
              ),
              height: 100,
              width: 150,
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width:MediaQuery.sizeOf(context).width*0.4,
                    child: Text(movieModel.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,overflow: TextOverflow.ellipsis),)),
                Text(movieModel.originalLanguage,style: TextStyle(color: Colors.grey.withOpacity(0.5),fontSize: 13,fontWeight: FontWeight.w500),),
              ],
            ),
            Spacer(),
            Icon(Icons.more_horiz,color: AppColors.blueColor,)
          ],
        ),
      ),
    );
  }
}
