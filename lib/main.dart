// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MyCard(),
    );
  }
}

class MyCard extends StatefulWidget {
  const MyCard({ Key? key }) : super(key: key);

  @override
  State<MyCard> createState() => _MyCardState();
}
List<Map<String, dynamic>> data = [
  {
    'card_no': '*****4013',
    'amount': '\$2562',
    'bgcolor': Colors.white,
    'icon': Icons.circle_rounded,
  },
  {
    'card_no': '*****1941',
    'amount': '\$144.99',
    'bgcolor': Colors.red,
    'icon': Icons.circle_rounded,
  },
  {
    'card_no': '*****6132',
    'amount': '\$30050',
    'bgcolor': Colors.amber,
    'icon': Icons.circle_rounded,
  },
  {
    'card_no': '*****9090',
    'amount': '\$6798',
    'bgcolor': Colors.blue,
    'icon': Icons.circle_rounded,
  },
];
class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Carousel Slider'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: const [
                Text('Your', style: TextStyle(fontSize: 15,),),
                Text('Cards', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              ],
            ),
          ),
          Container(padding: EdgeInsets.zero,
            child: CarouselSlider(items: data.map((e) {
              return ItemCard(
                cardNo: e['card_no'],
                amount: e['amount'],
                color: e['bgcolor'],
                icon: e['icon'],
              );
            }).toList(),
             options: CarouselOptions(autoPlay: true,)),
          ),
          Column(children: [
            Text("Activity",style: TextStyle(fontWeight: FontWeight.bold),)

          ],)
          
        ],
      ),
    );
  }
}
class ItemCard extends StatelessWidget {
  const ItemCard({ Key? key,
  required this.cardNo,
  required this.amount,
  required this.color,
  required this.icon})
   : super(key: key);
   final String cardNo;
   final String amount;
   final Color color;
   final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      
        children: [
          Icon(icon, color: Colors.redAccent),
          Text(cardNo),
          Text(amount)

        ],
      ),
    );
    
  }
}