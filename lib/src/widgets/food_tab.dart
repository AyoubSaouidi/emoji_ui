import 'package:emoji_ui/data_base.dart';
import 'package:emoji_ui/src/models/food.dart';
import 'package:emoji_ui/src/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'dart:math' as math;

class FoodTab extends StatefulWidget {
  final bool scrollDirectionVertical;
  final bool withRating;
  final bool promoPrice;
  final bool withAction;

  FoodTab(this.scrollDirectionVertical, this.withRating, this.promoPrice,
      this.withAction);

  @override
  _FoodTabState createState() => _FoodTabState();

  static Widget buildListItem(BuildContext context, Food food, bool withRating,
      bool promoPrice, bool withAction, bool withBg) {
    return Padding(
      padding: withBg
          ? const EdgeInsets.symmetric(horizontal: 10.0)
          : const EdgeInsets.symmetric(
              horizontal: 25.0,
              vertical: 10.0,
            ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 230.0,
            height: 100,
            padding: withBg
                ? const EdgeInsets.symmetric(horizontal: 10)
                : const EdgeInsets.all(0),
            decoration: withBg
                ? BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: food.bgColor.withOpacity(0.6),
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: food.bgColor.withOpacity(0.3),
                  )
                : BoxDecoration(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 75.0,
                  height: 75.0,
                  decoration: BoxDecoration(
                    color: food.bgColor,
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: Center(
                    child: !withBg
                        ? Hero(
                            tag: food.id,
                            child: Image(
                              image: AssetImage(food.imagePath),
                              width: 50.0,
                              height: 50.0,
                            ),
                          )
                        : Image(
                            image: AssetImage(food.imagePath),
                            width: 50.0,
                            height: 50.0,
                          ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food.name,
                      // textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    withRating
                        ? RatingBar.builder(
                            initialRating: food.rating,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            // itemPadding: const EdgeInsets.only(right: 0.5),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemSize: 20,
                            unratedColor: Colors.amber.shade100,
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          )
                        : Container(),
                    Row(
                      children: [
                        Text(
                          '\$${food.price}',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w700,
                            color: Color(0XFFF68D7F),
                          ),
                        ),
                        SizedBox(
                          width: 3.0,
                        ),
                        promoPrice
                            ? Text(
                                '\$${food.price + math.Random().nextInt(10)}',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey.withOpacity(0.4),
                                ),
                              )
                            : Container(),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          withAction
              ? ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(seconds: 1),
                        pageBuilder: (_, __, ___) => DetailsScreen(),
                        settings: RouteSettings(
                          arguments: food,
                        ),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.teal.shade300),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      scrollDirection:
          widget.scrollDirectionVertical ? Axis.vertical : Axis.horizontal,
      children: DataBase.foodDB
          .map((food) => FoodTab.buildListItem(context, food, widget.withRating,
              widget.promoPrice, widget.withAction, false))
          .toList(),
    ));
  }
}
