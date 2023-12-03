import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_details_model.dart';
import '../../utils/colors.dart';
import '../../widgets/genres_button_widget.dart';


class Details extends StatelessWidget {
  final MovieDetailsModel movieDetailsModel;
  const Details({Key? key,required this.movieDetailsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Genres',style: TextStyle(color: AppColors.primaryColor,fontSize: 16,fontWeight: FontWeight.w500),),
        SizedBox(height: 15),
        Wrap(
          children:List.generate(movieDetailsModel.genres.length, (index) {
            return GenresButtonWidget(title: movieDetailsModel.genres[index].name,  bgColor:AppColors.genresColors[index]);
          }),
        ),
        Divider(
          height: MediaQuery.sizeOf(context).height*0.05,
          color: Colors.grey.withOpacity(0.3),
        ),
        Text('Overview',style: TextStyle(color: AppColors.primaryColor,fontSize: 16,fontWeight: FontWeight.w500),),
        SizedBox(height: 10),
        Text(movieDetailsModel.overview,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300,fontSize: 13),)
      ],
    );
  }

}
