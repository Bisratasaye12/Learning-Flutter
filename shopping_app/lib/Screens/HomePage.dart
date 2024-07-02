import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final filters = const ['all', "Adidas", "Nike", "Yeezy", "New Balance"];
  late var _selected;

  @override
  void initState() {
    _selected = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Shoes \nCollection',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 35)),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[800]!),
                            borderRadius: BorderRadius.circular(30),
                          )),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
                height: 120,
                child: ListView.builder(
                    itemCount: filters.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selected = filters[index];
                            });
                          },
                          child: Chip(
                            backgroundColor: _selected == filters[index]
                                ? Theme.of(context).colorScheme.primary
                                : Color.fromARGB(255, 230, 230, 230),
                            side: BorderSide(
                                color: Color.fromARGB(255, 236, 235, 235)),
                            label: Text(
                              filters[index],
                            ),
                            labelStyle: TextStyle(fontSize: 16),
                            padding: EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(27),
                                    right: Radius.circular(27))),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
