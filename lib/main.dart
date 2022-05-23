// ignore_for_file: unused_import

import 'dart:ui';

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
  const MyCard({Key? key}) : super(key: key);

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
        title: const Text('Carousel Slider'),
      ),
      body: Column(children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const Text(
                  'Cards',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                CarouselSlider(
                    items: data.map((e) {
                      return ItemCard(
                        cardNo: e['card_no'],
                        amount: e['amount'],
                        color: e['bgcolor'],
                        icon: e['icon'],
                      );
                    }).toList(),
                    options: CarouselOptions(
                        autoPlay: true, viewportFraction: 0.4, height: 300)),
              ],
            ),
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:  [
                Text("Activity",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                OutlinedButton(onPressed:null, child: Container(child: Text('History',textAlign: TextAlign.center,))),
              ],
            ),
          ],
        ),
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(top: 20, left: 100),
                    child: Column(
                      children: const [
                        Text(
                          '06 June \n',
                          style: TextStyle(color: Colors.black26),
                        )
                      ],
                    )),
                cards(
                  title: 'Mcdonalds',
                  price: 60,
                  icon: Icons.food_bank,
                ),
                cards(
                  title: 'pizza',
                  price: 140,
                  icon: Icons.face_retouching_natural,
                ),
                cards(
                  title: 'Health insurance',
                  price: 51.91,
                  icon: Icons.health_and_safety,
                ),
                cards(
                  title: 'Transfer',
                  price: 300,
                  icon: Icons.account_balance,
                ),
                cards(
                  title: 'Bills',
                  price: 60,
                  icon: Icons.money,
                ),
                cards(
                  title: 'Health',
                  price: 210,
                  icon: Icons.health_and_safety_outlined,
                ),
                cards(
                  title: 'Mcdonalds',
                  price: 60,
                  icon: Icons.food_bank,
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [],
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card, color: Colors.black),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.credit_card,
            color: Colors.black,
          ),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card, color: Colors.black),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card, color: Colors.black),
          label: 'home',
        ),
      ]),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard(
      {Key? key,
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
      margin: EdgeInsets.all(16),
      width: 300,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            
            child: Center(
            
                child: Stack(
                
                  children: [
                          Positioned(
                            right: 5,child: roundcard(color: Colors.red,)),
                          roundcard(color: Colors.yellow,),
                  ],
                ),
              ),
            ),
          
          Text(cardNo),
          Text(amount)
        ],
      ),
    );
  }
}

class cards extends StatefulWidget {
  String title;
  double price;
  IconData icon;
  cards(
      {Key? key, required this.title, required this.price, required this.icon})
      : super(key: key);

  @override
  State<cards> createState() => _cardsState();
}

class _cardsState extends State<cards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                widget.icon,
                color: Colors.amber,
              ),
              Text(widget.title),
            ],
          ),
          Text('\$${widget.price}'),
        ],
      ),
    );
  }
}
class roundcard extends StatefulWidget {
  Color color;
  roundcard({ Key? key,required this.color }) : super(key: key);

  @override
  State<roundcard> createState() => _roundcardState();
}

class _roundcardState extends State<roundcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 30,
        height: 30,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(50)
        ,
       
      ),
    );
  }
}