import 'package:emoji_ui/src/screens/details_screen.dart';
import 'package:flutter/material.dart';
// Food Model
import '../models/food.dart';

class FoodItemCarousel extends StatelessWidget {
  // const FoodItemCarousel({ Key? key }) : super(key: key);

  final Food food;

  FoodItemCarousel(this.food);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: InkWell(
        onTap: () {
          // Navigator.pushNamed(context, DetailsScreen.routeName,
          //     arguments: food);
        },
        child: Container(
          width: 150.0,
          height: 170.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: food.bgColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Hero(
              //   tag: food.id,
              /*child:*/ Container(
                width: 75.0,
                height: 75.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image(
                    image: AssetImage(food.imagePath),
                    width: 50.0,
                    height: 50.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              // ),
              SizedBox(
                height: 25.0,
              ),
              Text(
                food.name,
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  fontSize: 17,
                  color: food.textColor,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                '\$ ${food.price}',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: food.textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
