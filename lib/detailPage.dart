import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final nameImage;
  final nameJacket;
  final int price;

  DetailPage({this.nameImage, this.nameJacket, this.price});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int total = 1;
  int totalPrice;

  void _increment() {
    setState(() {
      total++;
      totalPrice += widget.price;
    });
  }

  void _decrement() {
    setState(() {
      total--;
      totalPrice -= widget.price;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalPrice = widget.price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 300.0,
              ),
              Container(
                height: 200.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/blue.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100.0),
                      bottomRight: Radius.circular(100.0),
                    )),
              ),
              Positioned(
                top: 50.0,
                left: (MediaQuery.of(context).size.width / 2) - 125.0,
                child: Hero(
                  tag: widget.nameImage,
                  child: Container(
                    height: 250.0,
                    width: 250.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.nameImage),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    Icons.shopping_bag,
                    size: 30.0,
                  ),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.nameJacket,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 25.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Text(
                      '4.9',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.grey,
                          fontSize: 17.0),
                    ),
                    SizedBox(width: 10.0),
                    Icon(Icons.star, color: Colors.blueAccent, size: 16.0),
                    Icon(Icons.star, color: Colors.blueAccent, size: 16.0),
                    Icon(Icons.star, color: Colors.blueAccent, size: 16.0),
                    Icon(Icons.star, color: Colors.blueAccent, size: 16.0),
                    Icon(Icons.star, color: Colors.blueAccent, size: 16.0),
                  ],
                ),
                SizedBox(height: 25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rp. ${widget.price}k',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 17.0),
                    ),
                    Container(
                      width: 125.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.blueGrey[50]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove_circle_outline,
                                color: Colors.blueAccent),
                            onPressed: _decrement,
                          ),
                          Text(
                            '$total',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                color: Colors.blueAccent),
                          ),
                          IconButton(
                            icon: Icon(Icons.add_circle,
                                color: Colors.blueAccent),
                            onPressed: _increment,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Text('Deskripsi Jaket',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16.0,
                        color: Colors.black)),
                SizedBox(height: 15.0),
                Container(
                  child: Text(
                    'Jaket ini adalah jaket favorit saya karena memiliki warna yang tidak terlalu cerah dan desain yang simple.',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14.0,
                        color: Colors.grey),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.blueAccent,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 17.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          '\Rp. ${totalPrice}k',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
