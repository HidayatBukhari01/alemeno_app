import 'package:flutter/material.dart';

class Utils {
  static void snackbar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static Map<String, double> getDimensions(BuildContext context, bool includeAppBarHeight) {
    final appBarHeight = includeAppBarHeight ? AppBar().preferredSize.height : 0;
    final deviceHeight = MediaQuery.of(context).size.height -
        appBarHeight -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final deviceWidth = MediaQuery.of(context).size.width;
    return {"height": deviceHeight, "width": deviceWidth};
  }
}
