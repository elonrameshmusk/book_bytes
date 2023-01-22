import 'package:flutter/material.dart';
import 'package:bb/views/components/colors.dart';

class AddBookWidget extends StatefulWidget {
  const AddBookWidget({Key? key}) : super(key: key);

  @override
  State<AddBookWidget> createState() => _AddBookWidgetState();
}

class _AddBookWidgetState extends State<AddBookWidget> {
  final _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final Map<List<String>, bool> _books = {
    [
      'The man who knew infinity',
      'Robert Kanigel',
      'https://m.media-amazon.com/images/I/51iTh9JmZqL._SY264_BO1,204,203,200_QL40_FMwebp_.jpg'
    ]: false,
    [
      'Elon Musk: How the billionaire CEO of SpaceX and Tesla is shaping our future',
      'Ashlee Vance',
      'https://m.media-amazon.com/images/I/51UUIOQ4qLL._SY264_BO1,204,203,200_QL40_FMwebp_.jpg'
    ]: false,
    [
      'Edison: A life of invention',
      'Paul Israel',
      'https://m.media-amazon.com/images/I/41OyWx2uAIL._SY264_BO1,204,203,200_QL40_FMwebp_.jpg'
    ]: false,
    [
      'Steve Jobs',
      'Walter Isaacson',
      'https://m.media-amazon.com/images/I/41n1edvVlLL._SY264_BO1,204,203,200_QL40_FMwebp_.jpg'
    ]: false,
    [
      'Einstein: his life and universe',
      'Walter Isaacson',
      'https://m.media-amazon.com/images/I/41ajKKgqY2L._SY264_BO1,204,203,200_QL40_FMwebp_.jpg'
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add books'),
      ),
      body: Container(
          color: colors['background'],
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(16, 0, 16, 18),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: _controller.clear,
                      icon: const Icon(Icons.clear_outlined),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: colors['on_surface']!, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: colors['primary']!, width: 1)),
                    hintText: 'Search by book our author name',
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {},
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
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _books.update(
                                          _books.keys.elementAt(index),
                                          (value) => true);
                                    });
                                  },
                                  child: Center(
                                      child: Icon(
                                    _books.values.elementAt(index) == false
                                        ? Icons.add_circle_outline
                                        : Icons.check_circle_outline,
                                    color: colors['outline'],
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          )),
    );
  }
}
// programmed and maintained by Ramesh Innovations Pvt. Ltd.
