import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:submissiondicodingrasyid/detailPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int priceJacket1 = 250;
  int priceJacket2 = 350;
  int priceJacket3 = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu_rounded),
                  color: Colors.black,
                ),
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                          image: AssetImage('assets/profil.jpg'),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hai,',
                  style: TextStyle(
                      fontFamily: 'Futur',
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 50.0),
                ),
                Text(
                  'Rasyid',
                  style: TextStyle(
                      fontFamily: 'Futur',
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 50.0),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Jaket Favorit',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 17.0),
                ),
                SizedBox(height: 7.0),
                Container(
                  height: 250.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      buildListitem(
                          'assets/jaket1.jpg', 'Jaket Hoodie 1', priceJacket1),
                      buildListitem(
                          'assets/jaket2.jpg', 'Jaket Hoodie 2', priceJacket2),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text(
                    'Jaket Lainnya',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 17.0,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20.0),
                    child: Container(
                      height: 300.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                              image: AssetImage('assets/jaket3.jpg'),
                              fit: BoxFit.contain)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jaket Hoodie 3',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(height: 3.0),
                        Container(
                          width: 306.25,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '4.9',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.grey,
                                        fontSize: 12.0),
                                  ),
                                  SizedBox(width: 3.0),
                                  Icon(Icons.star,
                                      color: Colors.blueAccent, size: 14.0),
                                  Icon(Icons.star,
                                      color: Colors.blueAccent, size: 14.0),
                                  Icon(Icons.star,
                                      color: Colors.blueAccent, size: 14.0),
                                  Icon(Icons.star,
                                      color: Colors.blueAccent, size: 14.0),
                                  Icon(Icons.star,
                                      color: Colors.blueAccent, size: 14.0),
                                ],
                              ),
                              Text('Rp. ${priceJacket3}k',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: 16.0)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 75.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0)),
          color: Colors.blue,
        ),
        padding: EdgeInsets.only(left: 40.0, right: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.bookmark_border, color: Colors.white),
            Icon(Icons.search, color: Colors.white),
            Icon(Icons.shopping_basket, color: Colors.white),
            Icon(Icons.person_outline, color: Colors.white)
          ],
        ),
      ),
    );
  }

  Widget buildListitem(String nameImage, String nameJacket, int price) {
    var colorFav = Colors.black;

    void _colorChange() {
      if (colorFav == Colors.black) {
        setState(() {
          colorFav = Colors.red;
        });
      } else if (colorFav == Colors.red) {
        setState(() {
          colorFav = Colors.black;
        });
      }
    }

    return InkWell(
      onTap: () {
        Navigator.of(context).push((MaterialPageRoute(
            builder: (context) => DetailPage(
                nameImage: nameImage, nameJacket: nameJacket, price: price))));
      },
      child: Padding(
        padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
        child: Container(
          height: 200.0,
          width: 200.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                    blurRadius: 6.0,
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5.0),
              ]),
          child: Stack(
            children: [
              Container(
                height: 175.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.blueAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
              ),
              Hero(
                tag: nameImage,
                child: Container(
                  height: 175.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(nameImage), fit: BoxFit.contain),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      )),
                ),
              ),
              Positioned(
                  top: 160.0,
                  right: 20.0,
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      height: 30.0,
                      width: 30.0,
                      child: Center(
                        child: IconButton(
                          icon: Icon(Icons.favorite, color: colorFav),
                          onPressed: _colorChange,
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white),
                    ),
                  )),
              Positioned(
                top: 190.0,
                left: 10.0,
                child: Column(
                  children: [
                    Text(nameJacket,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 14.0)),
                    Container(
                      width: 175.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                '4.9',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.grey,
                                    fontSize: 12.0),
                              ),
                              SizedBox(height: 3.0),
                              Icon(Icons.star,
                                  color: Colors.blueAccent, size: 14.0),
                              Icon(Icons.star,
                                  color: Colors.blueAccent, size: 14.0),
                              Icon(Icons.star,
                                  color: Colors.blueAccent, size: 14.0),
                              Icon(Icons.star,
                                  color: Colors.blueAccent, size: 14.0),
                              Icon(Icons.star,
                                  color: Colors.blueAccent, size: 14.0),
                            ],
                          ),
                          Text('Rp. ${price}k',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16.0)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
