import 'package:emoji_ui/data_base.dart';
import 'package:emoji_ui/src/models/food.dart';
import 'package:emoji_ui/src/widgets/food_tab.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  static const routeName = '/details';

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
  }

  void incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void decrementQuantity() {
    setState(() {
      _quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final argsFood = ModalRoute.of(context)!.settings.arguments as Food;

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black54,
                    size: 25.0,
                  ),
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 42.0,
                      height: 42.0,
                      decoration: BoxDecoration(
                        color: Colors.tealAccent.shade700,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10.0,
                            spreadRadius: 0.0,
                            offset: Offset(1.0, 1.0),
                          ),
                        ],
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.shopping_basket,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    Positioned(
                      top: -4,
                      right: -4,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 1,
                            color: Colors.black.withOpacity(0.2),
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '1',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 80),
            child: Container(
              width: 140,
              // color: Colors.red,
              child: Text(
                argsFood.description.toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'NotoSans',
                  fontSize: 27.0,
                  fontWeight: FontWeight.w700,
                ),
                // overflow: TextOverflow.ellipsis,
                // maxLines: 3,
                softWrap: true,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            child: Container(
              height: 260,
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 260,
                    height: 260,
                    // color: Colors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(30, 35),
                                color: argsFood.bgColor.withOpacity(0.5),
                                spreadRadius: 0,
                                blurRadius: 40,
                              ),
                            ],
                          ),
                          child: Hero(
                            tag: argsFood.id,
                            child: Image(
                              image: AssetImage(argsFood.imagePath),
                              width: 220,
                              height: 220,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 140,
                          // color: Colors.blueGrey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.tealAccent.shade400
                                          .withOpacity(0.4),
                                      offset: Offset(0, 6),
                                      blurRadius: 10.0,
                                      spreadRadius: 0.0,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.tealAccent.shade400,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.tealAccent.shade400
                                          .withOpacity(0.4),
                                      offset: Offset(0, 6),
                                      blurRadius: 10.0,
                                      spreadRadius: 0.0,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.timelapse,
                                    color: Colors.tealAccent.shade400,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '\$${argsFood.price.floor() * _quantity}',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade500,
                  ),
                ),
                Container(
                  width: 265,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.tealAccent.shade400,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Container(
                          width: 100.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  decrementQuantity();
                                },
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.tealAccent.shade400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Text(
                                '$_quantity',
                                style: TextStyle(
                                  fontFamily: 'NotoSans',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.tealAccent.shade400,
                                ),
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              InkWell(
                                onTap: () {
                                  incrementQuantity();
                                },
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.tealAccent.shade400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      InkWell(
                        onTap: () => print('Added to cart'),
                        child: Text(
                          'Add to cart',
                          style: TextStyle(
                            fontFamily: 'NotoSans',
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 25.0,
            ),
            child: Text(
              'Featured'.toUpperCase(),
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'NotoSans',
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Container(
              width: MediaQuery.of(context).size.width - 25,
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: DataBase.foodDB
                    .map<Widget>((food) => FoodTab.buildListItem(
                        context, food, false, false, false, true))
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
