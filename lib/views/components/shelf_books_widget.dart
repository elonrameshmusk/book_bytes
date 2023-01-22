import 'package:bb/views/components/add_book_widget.dart';
import 'package:flutter/material.dart';
import 'package:bb/views/components/colors.dart';

class ShelfBooksWidget extends StatefulWidget {
  const ShelfBooksWidget({Key? key}) : super(key: key);

  @override
  State<ShelfBooksWidget> createState() => _ShelfBooksWidgetState();
}

class _ShelfBooksWidgetState extends State<ShelfBooksWidget> {
  final Map<List<String>, bool> _books = {
    [
      'Elon Musk: How the billionaire CEO of SpaceX and Tesla is shaping our future',
      'Ashlee Vance',
      'https://m.media-amazon.com/images/I/51UUIOQ4qLL._SY264_BO1,204,203,200_QL40_FMwebp_.jpg'
    ]: false,
    [
      'Steve Jobs',
      'Walter Isaacson',
      'https://m.media-amazon.com/images/I/41n1edvVlLL._SY264_BO1,204,203,200_QL40_FMwebp_.jpg'
    ]: false,
    [
      'The man who knew infinity',
      'Robert Kanigel',
      'https://m.media-amazon.com/images/I/51iTh9JmZqL._SY264_BO1,204,203,200_QL40_FMwebp_.jpg'
    ]: false,
    [
      'Einstein: his life and universe',
      'Walter Isaacson',
      'https://m.media-amazon.com/images/I/41ajKKgqY2L._SY264_BO1,204,203,200_QL40_FMwebp_.jpg'
    ]: false,
    [
      'Edison: A life of invention',
      'Paul Israel',
      'https://m.media-amazon.com/images/I/41OyWx2uAIL._SY264_BO1,204,203,200_QL40_FMwebp_.jpg'
    ]: false,
    [
      'The Google boys: Larry Page and Sergey Brin in their own words',
      'Bagadi Venkat Rmaehs',
      'https://m.media-amazon.com/images/I/51hSnBdwplL._SX373_BO1,204,203,200_.jpg'
    ]: false,
    [
      'Bagadi Venkat Ramesh: His world we live in',
      'Walter Isaacson',
      'https://d2cbg94ubxgsnp.cloudfront.net/Pictures/480xAny/2/8/3/503283_the_universe_1.9781788686365.browse.0_22969.jpg'
    ]: false,
  };
  final List<String> _checkedItems = [];
  getCheckboxItems() {
    _books.forEach((key, value) {
      if (value == true) {
        _checkedItems.add(key[0]);
      }
    });
    print(_checkedItems);
    _checkedItems.clear();
  }

  bool item_select_mode = false;
  Widget variableWidget(int index) {
    if (item_select_mode) {
      return Checkbox(
          checkColor: Colors.white,
          activeColor: colors['primary'],
          value: _books.values.elementAt(index),
          onChanged: (bool? value) {
            setState(() {
              _books[_books.keys.elementAt(index)] =
                  !_books.values.elementAt(index);
            });
          });
    } else {
      return Icon(
        Icons.more_vert,
        color: colors['outline'],
      );
    }
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
          item_select_mode ? 'Select books' : 'Books',
          style: TextStyle(color: colors['on_surface']),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (item_select_mode) {
                setState(() {
                  _books.forEach((key, value) {
                    _books[key] = true;
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
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          print('book pressed');
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                          height: 60,
                          width: MediaQuery.of(context).size.width * 1,
                          child: Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.20,
                                height: MediaQuery.of(context).size.height * 1,
                                child: Center(
                                    child: Image(
                                        image: NetworkImage(
                                            _books.keys.elementAt(index)[2])
                                        // color: colors['primary_container'],
                                        )),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.60,
                                  height:
                                      MediaQuery.of(context).size.height * 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _books.keys.elementAt(index)[0],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: colors['on_background']),
                                      ),
                                      Text(
                                        _books.keys.elementAt(index)[1],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color:
                                                colors['on_surface_variant']),
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.20,
                                height: MediaQuery.of(context).size.height * 1,
                                child: Center(
                                  child: variableWidget(index),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colors['primary'],
                      foregroundColor: colors['on_primary']),
                  child: const Text('Add new book'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddBookWidget()),
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}
// programmed and maintained by Ramesh Innovations Pvt. Ltd.
