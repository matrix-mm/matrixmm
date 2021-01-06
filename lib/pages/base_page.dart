import 'package:flutter/material.dart';
import 'package:matrixmm/utils/ProgressHUD.dart';

class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);
  @override
  BasePageState createState() => BasePageState();
}

class BasePageState<T extends BasePage> extends State<T> {
  bool isApiCallProcess = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ProgressHUD(
        child: pageUI(),
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
      ),
    );
  }

  Widget pageUI() {
    return null;
  }

  Widget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      brightness: Brightness.dark,
      elevation: 0,
      backgroundColor: Colors.black87,
      automaticallyImplyLeading: false,
      leading: Navigator.canPop(context)
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.white70,
                size: 23,
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      title: Text(
        "MATRiX OnlineShop",
        style: TextStyle(color: Colors.amberAccent[700]),
      ),
      actions: [
        Icon(
          Icons.notifications_none,
          color: Colors.white70,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.shopping_cart,
          color: Colors.white70,
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
