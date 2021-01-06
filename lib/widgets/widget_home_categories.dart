import 'package:flutter/material.dart';
import 'package:matrixmm/api_service.dart';
import 'package:matrixmm/models/category.dart';
import 'package:matrixmm/pages/product_page.dart';

class WidgetCategories extends StatefulWidget {
  @override
  _WidgetCategoriesState createState() => _WidgetCategoriesState();
}

class _WidgetCategoriesState extends State<WidgetCategories> {
  APIService apiService;

  @override
  void initState() {
    apiService = new APIService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, top: 4),
                child: Text(
                  'All Categories',
                  style: TextStyle(
                      color: Colors.amberAccent[700],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, top: 4, right: 10),
                child: Text(
                  'View All',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              )
            ],
          ),
          _categoriesList()
        ],
      ),
    );
  }

  Widget _categoriesList() {
    return new FutureBuilder(
      future: apiService.getCategories(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Category>> model,
      ) {
        if (model.hasData) {
          return _buildCategoryList(model.data);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _buildCategoryList(List<Category> categories) {
    return Container(
      color: Colors.blueGrey[100],
      height: 150,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          var data = categories[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductPage(
                            categoryId: data.categoryId,
                          )));
            },
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: 80,
                  height: 80,
                  alignment: Alignment.center,
                  child: Image.network(
                    data.image.url,
                    height: 80,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0x00000000),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(0, 5),
                          blurRadius: 15),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(child: Text(data.categoryName.toString())),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.amberAccent[700],
                      size: 14,
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
