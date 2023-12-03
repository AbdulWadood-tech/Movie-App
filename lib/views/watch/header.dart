import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_details_model.dart';
import 'package:movies_app/views/watch/getTickets/select_seats_screen.dart';
import 'package:movies_app/views/watch/videoPlayer/video_player_screen.dart';
import 'package:provider/provider.dart';
import '../../controllers/movies_controller.dart';
import '../../utils/colors.dart';
import '../../widgets/back_button_widget.dart';
import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_loader.dart';

class Header extends StatelessWidget {
  final MovieDetailsModel movieDetailsModel;
  const Header({Key? key,required this.movieDetailsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 50),
      height: MediaQuery.sizeOf(context).height*0.6,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image:NetworkImage(MoviesController.buildPosterUrl(movieDetailsModel.posterPath)),
              fit: BoxFit.cover
          )
      ),
      child: Column(
        children: [
          BackButtonWidget(),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width*0.10),
            child: Column(
              children: [
                Text('In theaters ${MoviesController().formatReleaseDate(movieDetailsModel.releaseDate)}',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 18),),
                SizedBox(height: 10),
                CustomButtonWidget(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return SelectSeatsScreen(movieDetailsModel: movieDetailsModel,);
                  }));
                }, title: 'Get Tickets',filledColor: AppColors.blueColor,),
                SizedBox(height: 20),
                CustomButtonWidget(onTap: ()async{
                  customLoader(context);
                  await Provider.of<MoviesController>(context,listen: false).getMovieVideos(movieDetailsModel.id);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                    return VideoPlayerScreen();
                  }));
                }, title: 'Watch Trailer',borderColor: AppColors.blueColor,prefixIcon: Icon(Icons.play_arrow,color: Colors.white,),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
