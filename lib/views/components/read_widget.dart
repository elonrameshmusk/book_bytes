import 'package:flutter/material.dart';
class ReadWidget extends StatefulWidget {
  const ReadWidget({Key? key}) : super(key: key);

  @override
  State<ReadWidget> createState() => _ReadWidgetState();
}

class _ReadWidgetState extends State<ReadWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('read widget'),
    );
  }
}
