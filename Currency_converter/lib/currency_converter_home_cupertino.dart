import 'package:flutter/cupertino.dart';



class CupertinoHome extends StatefulWidget {
  const CupertinoHome({super.key});

  
  @override
  State<CupertinoHome> createState() => _CupertinoHomeState();
}


class _CupertinoHomeState extends State<CupertinoHome> {
  double result = 0;
  final TextEditingController texteditingcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {




    return CupertinoPageScaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        navigationBar: const CupertinoNavigationBar(
          backgroundColor: CupertinoColors.black,
          middle: const Text('Cupertino Currency Converter'),
        ),
       child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            // The counter
            Text(
              "Birr ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0) }",
              style: const TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w100,
                color: CupertinoColors.white
              ),
              ),

            // The input Field
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              margin:const  EdgeInsets.only(bottom: 8.0),
              child:  CupertinoTextField(
                controller: texteditingcontroller,
                style: const TextStyle(color: CupertinoColors.black),
                decoration:  BoxDecoration(
                   color: CupertinoColors.white,
                   border: Border.all(),
                   borderRadius: BorderRadius.all(Radius.circular(5)),
                  
                ),
                placeholder:'enter the amount in USD' ,
                prefix: const Icon(CupertinoIcons.money_dollar),
                keyboardType: const TextInputType.numberWithOptions(decimal: true), 
              
              ),

            
            ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10.0),
               child: CupertinoButton(
                onPressed: () {
                  
                  setState(() {
                    result = double.parse(texteditingcontroller.text) * 56;
                  });
                },
                color: CupertinoColors.activeOrange,
                child: const Text('Convert')              
                
              ),
             ) 
          ],)
          )
      );
  }
}
