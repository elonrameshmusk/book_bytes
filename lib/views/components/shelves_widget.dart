import 'package:flutter/material.dart';

class ShelvesWidget extends StatefulWidget {
  const ShelvesWidget({Key? key}) : super(key: key);

  @override
  State<ShelvesWidget> createState() => _ShelvesWidgetState();
}

class _ShelvesWidgetState extends State<ShelvesWidget> {
  static const List<String> _shelves = [
    'Physics',
    'Maths',
    'Biology',
    'Astronomy',
    'Automobiles',
    'Programming',
    'Entrepreneurship',
    'Science fiction',
    'Non fiction',
    'Fantasy'
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 60,
            width: MediaQuery.of(context).size.width * 1,
            child: Row(
              children: [
                Container(
                  color: Colors.orange,
                  width: MediaQuery.of(context).size.width * 0.20,
                  height: MediaQuery.of(context).size.height * 1,
                  child: Center(child: Text('I')),
                ),
                Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.60,
                    height: MediaQuery.of(context).size.height * 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _shelves[index],
                        )
                      ],
                    )
                    ),
                Container(
                  color: Colors.green,
                  width: MediaQuery.of(context).size.width * 0.20,
                  height: MediaQuery.of(context).size.height * 1,
                  child: Center(child: Text('M')),
                ),
              ],
            ),
          );
        });
  }
}
