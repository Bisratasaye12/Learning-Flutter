import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            )
          ],
        ),
      ),
    );
  }
}
