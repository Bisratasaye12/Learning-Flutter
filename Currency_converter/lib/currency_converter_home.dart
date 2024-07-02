
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StatefulHome extends StatefulWidget{
  const StatefulHome({super.key});
  @override
  State<StatefulHome> createState() => _Home();
}


class _Home extends State<StatefulHome>{
  double result = 0;
  final TextEditingController texteditingcontroller = TextEditingController();

  
  @override
  Widget build(BuildContext context){


    const border =  OutlineInputBorder(
                  borderSide:  BorderSide(color: Colors.grey, width: 2.0),
                  
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                 );

    return  Scaffold(
        backgroundColor: Color.fromRGBO(0, 0, 0, 1),
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: const Text("Currency Converter", style: TextStyle(color: Colors.white,)),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            // The counter
            Text(
              "Birr ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0) }",
              style: const TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w100,
                color: Colors.white
              ),
              ),

            // The input Field
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              margin: const EdgeInsets.only(bottom: 8.0),
              child:  TextField(
                controller: texteditingcontroller,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                   hintText: 'enter the amount in USD',
                   hintStyle: TextStyle(color: Colors.grey),
                   prefixIcon: Icon(Icons.monetization_on),
                   prefixIconColor: Colors.grey,
                   filled: true,
                   fillColor: Colors.white,
                   focusedBorder: border,
                   enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true), 
              
              ),

            
            ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10.0),
               child: TextButton(
                onPressed: () {
                  
                  setState(() {
                    result = double.parse(texteditingcontroller.text) * 56;
                  });
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.orange),
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                    minimumSize: MaterialStatePropertyAll(Size(double.infinity, 60)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
      
                  )
                ,
                
                child: const Text('Convert')              
                
                         ),
             ) 
          ],)
          )
      );
  }
}