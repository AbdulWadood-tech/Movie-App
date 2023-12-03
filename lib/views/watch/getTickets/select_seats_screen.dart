import 'package:flutter/material.dart';
import 'package:movies_app/controllers/movies_controller.dart';
import 'package:movies_app/models/movie_details_model.dart';
import 'package:movies_app/utils/colors.dart';
import 'package:movies_app/views/watch/getTickets/checkout_screen.dart';
import 'package:movies_app/widgets/custom_button_widget.dart';

class SelectSeatsScreen extends StatefulWidget {
  final MovieDetailsModel movieDetailsModel;
  const SelectSeatsScreen({Key? key,required this.movieDetailsModel}) : super(key: key);

  @override
  State<SelectSeatsScreen> createState() => _SelectSeatsScreenState();
}

class _SelectSeatsScreenState extends State<SelectSeatsScreen> {
  int selectedDay = 3;
  int selectedTimeIndex= 0;
  List moviesSeats = [
    {
      'Seat Image': 'assets/images/seats.png',
      'Name': 'Cinetech + hall 1',
      'Time': '12:30',
      'Min Price': '50\$',
      'Bonus':'2500',
    },
    {
      'Seat Image': 'assets/images/seats.png',
      'Name': 'Cinetech + hall 1',
      'Time': '13:30',
      'Min Price': '75\$',
      'Bonus':'300',
    },
    {
      'Seat Image': 'assets/images/seats.png',
      'Name': 'Cinetech + hall 1',
      'Time': '14:30',
      'Min Price': '150\$',
      'Bonus':'500',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        title: Column(
          children: [
            Column(
              children: [
                Text(widget.movieDetailsModel.title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.primaryColor),),
                Text('In Theaters ${MoviesController().formatReleaseDate(widget.movieDetailsModel.releaseDate)}',style: TextStyle(color: AppColors.blueColor,fontSize: 13,fontWeight: FontWeight.w500),),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height*0.09),
            Text('Date',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(31, (index){
                  return InkWell(
                    onTap: (){
                      setState(() {
                        selectedDay = index+1;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10,bottom: 10),
                      padding: EdgeInsets.symmetric(horizontal: 17,vertical: 6),
                      decoration: BoxDecoration(
                        color:selectedDay==index+1? AppColors.blueColor:Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text('${index+1} Dec',style: TextStyle(color:selectedDay==index+1? Colors.white:Colors.black,fontWeight: FontWeight.w600,fontSize: 13),),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 30),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(moviesSeats.length, (index){
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          selectedTimeIndex = index;
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children:  <TextSpan>[
                                TextSpan(text: moviesSeats[index]['Time'], style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 14)),
                                TextSpan(text:  '  ${moviesSeats[index]['Name']}',style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color:selectedTimeIndex==index? AppColors.blueColor:Colors.grey.withOpacity(0.3),width: 2)
                            ),
                            height: MediaQuery.sizeOf(context).height*0.2,
                            width: MediaQuery.sizeOf(context).width*0.7,
                            child: Image.asset(moviesSeats[index]['Seat Image']),
                            padding: EdgeInsets.all(15),
                          ),
                          SizedBox(height: 10),
                          RichText(
                            text: TextSpan(
                              children:  <TextSpan>[
                                TextSpan(text: 'From', style: TextStyle(fontWeight: FontWeight.w500,color: Colors.grey,fontSize: 14)),
                                TextSpan(text:  ' ${moviesSeats[index]['Min Price']}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 14)),
                                TextSpan(text: ' or ', style: TextStyle(fontWeight: FontWeight.w500,color: Colors.grey,fontSize: 14)),
                                TextSpan(text:  '${moviesSeats[index]['Bonus']} bonus',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 14)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            Spacer(),
            CustomButtonWidget(
                filledColor: AppColors.blueColor,
                onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return CheckOutScreen(movieDetailsModel: widget.movieDetailsModel,);
              }));
            }, title: 'Select Seats'),
          ],
        ),
      ),
    );
  }
}
