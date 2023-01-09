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
  bool item_select_mode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Container(
        color: colors['background'],
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    if (item_select_mode) {
                      return CheckboxListTile(
                        title: Text(_books.keys.elementAt(index)[0]),
                        value: _books[_books.keys.elementAt(index)],
                        activeColor: Colors.pink,
                        checkColor: Colors.white,
                        onChanged: (bool? value) {
                          setState(() {
                            _books[_books.keys.elementAt(index)] = value!;
                          });
                        },
                      );
                    } else {
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
                                        image: NetworkImage(_books.keys.elementAt(index)[2])
                                      // color: colors['primary_container'],
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
                                        _books.keys.elementAt(index)[0],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: colors['on_background']
                                        ),
                                      ),
                                      Text(
                                        _books.keys.elementAt(index)[1],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: colors['on_surface_variant']
                                        ),
                                      ),
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
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: colors['primary'],
                    foregroundColor: colors['on_primary']
                ),
                child: const Text('Add new book'),
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    backgroundColor: colors['background'],
                    title: Text('add new book',
                        style: TextStyle(color: colors['on_background'])),
                    content: TextField(
                      // controller: _dialogTextFieldController,
                      cursorColor: colors['primary'],
                      decoration: InputDecoration(
                        hintText: 'New book',
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
                          // print(_dialogTextFieldController.text);
                          Navigator.pop(context, 'Add');
                        },
                        child: Text(
                          'Add',
                          style: TextStyle(color: colors['primary']),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
// programmed and maintained by Ramesh Innovations Pvt. Ltd.
