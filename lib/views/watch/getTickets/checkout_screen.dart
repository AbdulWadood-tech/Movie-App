import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_details_model.dart';
import 'package:movies_app/widgets/custom_button_widget.dart';
import 'package:movies_app/widgets/seat_widget.dart';
import '../../../controllers/movies_controller.dart';
import '../../../utils/colors.dart';

class CheckOutScreen extends StatelessWidget {
  final MovieDetailsModel movieDetailsModel;
  const CheckOutScreen({Key? key,required this.movieDetailsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Column(
              children: [
                Text(movieDetailsModel.title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.primaryColor),),
                Text('In Theaters ${MoviesController().formatReleaseDate(movieDetailsModel.releaseDate)}',style: TextStyle(color: AppColors.blueColor,fontSize: 13,fontWeight: FontWeight.w500),),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white.withOpacity(0.99),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height*0.05),
            Image.asset('assets/images/group.png'),
            Spacer(),
            Row(
              children: [
                SeatWidget(title: 'Selected', icon: 'assets/images/singleseat1.png'),
                SeatWidget(title: 'Not available', icon: 'assets/images/singleseat1.png'),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                SeatWidget(title: 'VIP (150\$)', icon: 'assets/images/singleseat1.png'),
                SeatWidget(title: 'Regular (50 \$)', icon: 'assets/images/singleseat1.png'),
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height*0.05),
            Container(
              alignment: Alignment.center,
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("4 /",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  Text(" 3 row",style: TextStyle(fontSize: 12)),
                  SizedBox(width: 10),
                  Icon(Icons.clear,size: 15,)
                ],
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height*0.05),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Total Price"),
                      Text("\$ 50",style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(child: CustomButtonWidget(onTap: (){}, title: 'Proceed to pay',filledColor: AppColors.blueColor,))
              ],
            )
          ],
        ),
      ),
    );
  }
}
