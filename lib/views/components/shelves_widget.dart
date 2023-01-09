import 'package:flutter/material.dart';
import 'package:bb/views/components/colors.dart';
import 'package:bb/views/components/shelf_books_widget.dart';

class ShelvesWidget extends StatefulWidget {
  const ShelvesWidget({Key? key}) : super(key: key);

  @override
  State<ShelvesWidget> createState() => _ShelvesWidgetState();
}

class _ShelvesWidgetState extends State<ShelvesWidget> {
  final Map<String, bool> _shelves = {
    'Physics': false,
    'Maths': false,
    'Biology': false,
    'Astronomy': false,
    'Automobiles': false,
    'Programming': false,
    'Entrepreneurship': false,
    'Science fiction': false,
    'Non fiction': false,
    'Fantasy': false,
    '_Programming': false,
    '_Entrepreneurship': false,
    '_Science fiction': false,
    '_Non fiction': false,
    '_Fantasy': false
  };
  final List<String> _checkedItems = [];
  getCheckboxItems() {
    _shelves.forEach((key, value) {
      if (value == true) {
        _checkedItems.add(key);
      }
    });
    print(_checkedItems);
    _checkedItems.clear();
  }

  bool item_select_mode = false;
  final _dialogTextFieldController = TextEditingController();
  @override
  void dispose() {
    _dialogTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        leading: IconButton(
          onPressed: () {
            if (item_select_mode) {
              setState(() {
                item_select_mode = false;
              });
            }
          },
          icon: Icon(item_select_mode ? Icons.arrow_back : Icons.menu),
        ),
        title: Text(
          item_select_mode ? 'Select shelves' : 'Shelves',
          style: TextStyle(color: colors['on_surface']),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (item_select_mode) {
                setState(() {
                  _shelves.forEach((key, value) {
                    _shelves[key] = true;
                  });
                });
              } else {}
            },
            icon: Icon(item_select_mode ? Icons.checklist : Icons.search),
          ),
          IconButton(
            onPressed: () {
              if (item_select_mode) {
                getCheckboxItems();
              } else {
                setState(() {
                  item_select_mode = !item_select_mode;
                });
              }
            },
            icon: Icon(
                item_select_mode ? Icons.delete : Icons.check_box_outlined),
          ),
        ],
      ),
      body: Container(
          color: colors['background'],
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (BuildContext context, int index) {
                      if (item_select_mode) {
                        return CheckboxListTile(
                          title: Text(_shelves.keys.elementAt(index)),
                          value: _shelves[_shelves.keys.elementAt(index)],
                          activeColor: Colors.pink,
                          checkColor: Colors.white,
                          onChanged: (bool? value) {
                            setState(() {
                              _shelves[_shelves.keys.elementAt(index)] = value!;
                            });
                          },
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            print('shelf pressed');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ShelfBooksWidget()),
                            );
                          },
                          child: SizedBox(
                            height: 60,
                            width: MediaQuery.of(context).size.width * 1,
                            child: Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.20,
                                  height:
                                      MediaQuery.of(context).size.height * 1,
                                  child: Center(
                                      child: Icon(
                                    Icons.folder,
                                    color: colors['primary_container'],
                                  )),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.60,
                                    height:
                                        MediaQuery.of(context).size.height * 1,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _shelves.keys.elementAt(index),
                                        )
                                      ],
                                    )),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.20,
                                  height:
                                      MediaQuery.of(context).size.height * 1,
                                  child: Center(
                                      child: Icon(
                                    Icons.more_vert,
                                    color: colors['outline'],
                                  )),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    }),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors['primary'],
                    foregroundColor: colors['on_primary']
                  ),
                  child: const Text('Add new shelf'),
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      backgroundColor: colors['background'],
                      title: Text('Create new shelf',
                          style: TextStyle(color: colors['on_background'])),
                      content: TextField(
                        controller: _dialogTextFieldController,
                        cursorColor: colors['primary'],
                        decoration: InputDecoration(
                          hintText: 'New shelf',
                          contentPadding: const EdgeInsets.all(8),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: colors['primary']!, width: 2.0),
                          ),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: colors['primary']),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            print(_dialogTextFieldController.text);
                            Navigator.pop(context, 'Create');
                          },
                          child: Text(
                            'Create',
                            style: TextStyle(color: colors['primary']),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),

    );
  }
}
