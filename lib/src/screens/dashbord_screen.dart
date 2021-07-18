import 'package:emoji_ui/src/widgets/foodItem_carousel.dart';
import 'package:emoji_ui/src/widgets/food_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/food.dart';
import '../../data_base.dart';

class DashBoardScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  List<Food> recommendedFoodList =
      DataBase.foodDB.where((food) => food.recommended).toList();

  @override
  void initState() {
    super.initState();
    print(recommendedFoodList);
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // tabController.;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                Icon(
                  Icons.menu_sharp,
                  color: Colors.black54,
                  size: 25.0,
                ),
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
                    image: DecorationImage(
                      image: AssetImage('assets/images/tuxedo.png'),
                      fit: BoxFit.contain,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'search for'.toUpperCase(),
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'NotoSans',
                fontSize: 27.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'recipes'.toUpperCase(),
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'NotoSans',
                fontSize: 27.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              padding: const EdgeInsets.only(
                left: 5.0,
                top: 3.0,
                bottom: 3.0,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    fontFamily: 'NotoSans',
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  // filled: true,
                  fillColor: Colors.grey.withOpacity(0.5),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 25.0,
            ),
            child: Text(
              'Recommended',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'NotoSans',
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            // padding: const EdgeInsets.only(right: 25.0),
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: recommendedFoodList
                  .map((food) => FoodItemCarousel(food))
                  .toList(),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: TabBar(
              controller: tabController,
              isScrollable: true,
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              labelStyle: TextStyle(
                fontFamily: 'NotoSans',
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelStyle: TextStyle(
                fontFamily: 'NotoSans',
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
              tabs: [
                Tab(child: Text('FEATURED')),
                Tab(child: Text('COMBO')),
                Tab(child: Text('FAVORITES')),
                Tab(child: Text('RECOMMENDED')),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 600,
            child: TabBarView(
              controller: tabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                FoodTab(true, true, true, true),
                FoodTab(true, true, true, true),
                FoodTab(true, true, true, true),
                FoodTab(true, true, true, true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
