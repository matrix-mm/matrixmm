import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:matrixmm/config.dart';
import 'package:matrixmm/widgets/widget_home_categories.dart';
import 'package:matrixmm/widgets/widget_home_products.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            imageCarousel(context),
            WidgetCategories(),
            WidgetHomeProducts(
              labelName: "Top Savers Today!",
              tagId: Config.todayOffersTagId,
            ),
            WidgetHomeProducts(
              labelName: "Top Selling Products!",
              tagId: Config.topSellingProductsTagId,
            ),
            WidgetHomeProducts(
              labelName: "Special!",
              tagId: Config.specialTagId,
            )
          ],
        ),
      ),
    );
  }

  Widget imageCarousel(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      child: new Carousel(
        overlayShadow: false,
        borderRadius: true,
        boxFit: BoxFit.fill,
        autoplay: true,
        dotSize: 4.0,
        dotColor: Colors.lightBlueAccent,
        images: [
          FittedBox(
            fit: BoxFit.fill,
            child: Image.network(
                "https://matrixmmstore.000webhostapp.com/wp-content/uploads/2020/12/106032630_2605153449732320_6528820302648262717_n-324x324.jpg"),
          ),
          FittedBox(
            fit: BoxFit.fill,
            child: Image.network(
                "https://matrixmmstore.000webhostapp.com/wp-content/uploads/2020/12/131098691_2756316734615990_1043609012084434951_n-324x324.jpg"),
          ),
          FittedBox(
            fit: BoxFit.fill,
            child: Image.network(
                "https://matrixmmstore.000webhostapp.com/wp-content/uploads/2020/12/vibe-324x324.jpg"),
          ),
          FittedBox(
            fit: BoxFit.fill,
            child: Image.network(
                "https://matrixmmstore.000webhostapp.com/wp-content/uploads/2020/12/131625554_2757027541211576_1300047443136080082_n-324x324.jpg"),
          )
        ],
      ),
    );
  }
}
