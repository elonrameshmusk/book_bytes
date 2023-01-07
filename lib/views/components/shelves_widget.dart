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

  bool itemSelectMode = false;
  final _dialogTextFieldController = TextEditingController();
  @override
  void dispose() {
    _dialogTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings){
        Widget page = Scaffold(
            appBar: AppBar(
              scrolledUnderElevation: 0.0,
              leading: IconButton(
                onPressed: () {
                  if (itemSelectMode) {
                    setState(() {
                      itemSelectMode = !itemSelectMode;
                    });
                  }
                },
                icon: Icon(itemSelectMode ? Icons.arrow_back : Icons.menu),
              ),
              title: Text(
                itemSelectMode ? 'Select shelves' : 'Shelves',
                style: TextStyle(color: colors['on_surface']),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    if (itemSelectMode) {
                      setState(() {
                        _shelves.forEach((key, value) {
                          _shelves[key] = true;
                        });
                      });
                    } else {}
                  },
                  icon: Icon(itemSelectMode ? Icons.checklist : Icons.search),
                ),
                IconButton(
                  onPressed: () {
                    if (itemSelectMode) {
                      getCheckboxItems();
                    } else {
                      setState(() {
                        itemSelectMode = !itemSelectMode;
                      });
                    }
                  },
                  icon: Icon(
                      itemSelectMode ? Icons.delete : Icons.check_box_outlined),
                ),
              ],
            ),
            body: Container(
              color: colors['background'],
              child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    if (itemSelectMode) {
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
                        onTap: (){
                          Navigator.pushNamed(context, 'shelf_books');
                        },
                        child: SizedBox(
                          height: 60,
                          width: MediaQuery.of(context).size.width * 1,
                          child: Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.20,
                                height: MediaQuery.of(context).size.height * 1,
                                child: Center(
                                    child: Icon(
                                      Icons.folder,
                                      color: colors['primary_container'],
                                    )),
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.60,
                                  height: MediaQuery.of(context).size.height * 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _shelves.keys.elementAt(index),
                                      )
                                    ],
                                  )),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.20,
                                height: MediaQuery.of(context).size.height * 1,
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
            floatingActionButton: Visibility(
              visible: !itemSelectMode,
              child: FloatingActionButton(
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
                        hintText: 'New folder',
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
                child: const Icon(Icons.add),
              ),
            ),);
        if(settings.name=='shelf_books') page = ShelfBooksWidget();
        return MaterialPageRoute(builder: (_)=>page);
      },
    );
  }
}
