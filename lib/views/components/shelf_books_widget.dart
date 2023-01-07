import 'package:flutter/material.dart';
import 'package:bb/views/components/colors.dart';
class ShelfBooksWidget extends StatefulWidget {
  const ShelfBooksWidget({Key? key}) : super(key: key);

  @override
  State<ShelfBooksWidget> createState() => _ShelfBooksWidgetState();
}

class _ShelfBooksWidgetState extends State<ShelfBooksWidget> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('Page 2'),
        ),
        body: new Center(
          child: new Text('PAGE 2'),
        ),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}
// programmed and maintained by Ramesh Innovations Pvt. Ltd.