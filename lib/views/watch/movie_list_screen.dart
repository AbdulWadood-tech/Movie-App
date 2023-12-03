import 'package:flutter/material.dart';
import 'package:movies_app/controllers/movies_controller.dart';
import 'package:movies_app/utils/colors.dart';
import 'package:movies_app/widgets/searched_movie_widget.dart';
import 'package:movies_app/widgets/custom_search_field.dart';
import 'package:movies_app/widgets/movie_widget.dart';
import 'package:provider/provider.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  bool isSearching = false;
  String searchingValue = '';

  @override
  Widget build(BuildContext context) {
    Provider.of<MoviesController>(context,listen:true).getMoviesList();
    return Consumer<MoviesController>(builder: (context,movie,child){
      return Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.1),
        appBar:!isSearching? AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          title: Text('Watch',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
          actions: [
            IconButton(onPressed: (){
              setState(() {
                isSearching=true;
              });
            }, icon: Icon(Icons.search))
          ],
        ):AppBar(
          actions: [
           CustomSearchField(
               onChanged: (val){
             setState(() {
               searchingValue=val;
             });
           },
             onCancel: (){
               setState(() {
                 isSearching=false;
               });
             },
           )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:!isSearching? movie.moviesList.isEmpty?Center(child: CircularProgressIndicator()): ListView.builder(
              itemCount: movie.moviesList.length,
              itemBuilder: (context,index){
                return MovieWidget(movieModel: movie.moviesList[index]);
              }):isSearching&&searchingValue==''?
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.5
              ),
              itemCount:movie.movieCategories.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(movie.movieCategories[index].image),
                      fit: BoxFit.cover
                    )
                  ),
                  child: Text(movie.movieCategories[index].name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16),),
                );
              },
            ),
          ):
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Top results',style: TextStyle(fontWeight: FontWeight.w500),),
                Divider(height: 30),
                Expanded(child: ListView.builder(
                    itemCount: movie.moviesList.length,
                    itemBuilder: (context,index){
                      if(movie.moviesList[index].title.toUpperCase().contains(searchingValue.toUpperCase())){
                        return SearchedMovieWidget(movieModel: movie.moviesList[index]);
                      }
                      return SizedBox();

                })),
              ],
            ),
          ),
        ),
      );
    });
  }
}
