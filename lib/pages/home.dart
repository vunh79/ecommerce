import 'package:flutter/material.dart';

import 'package:carousel_pro/carousel_pro.dart';

// my own imports
import 'package:ecommerce/components/horizontal_listview.dart';
import 'package:ecommerce/components/products.dart';
import 'package:ecommerce/pages/cart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
        height: 200.0,
        child: new Carousel(
          boxFit: BoxFit.cover,
          images: [
            AssetImage('images/c1.jpg'),
            AssetImage('images/m1.jpeg'),
            AssetImage('images/w3.jpeg'),
            AssetImage('images/w4.jpeg'),
            AssetImage('images/m2.jpg')
          ],
          autoplay: false,
          //animationCurve: Curves.fastOutSlowIn,
          //animationDuration: Duration(milliseconds: 100),
          dotSize: 4.0,
          indicatorBgPadding: 2.0,
          dotBgColor: Colors.transparent,
        ));
    return Scaffold(
        appBar: new AppBar(
            elevation: 0.1,
            backgroundColor: Colors.blueAccent,
            title: Text(
              'Mua Bán Tốt',
              style: TextStyle(color: Colors.white),
            ),
            actions: <Widget>[
              new IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                onPressed: () {},
              ),
              new IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Cart()));
                },
              )
            ]),
        drawer: new Drawer(
            child: new ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountName: Text('Hoàng Vũ'),
                  accountEmail: Text('vunh247@gmail.com'),
                  currentAccountPicture: GestureDetector(
                      child: new CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person, color: Colors.black12))),
                  decoration: new BoxDecoration(color: Colors.pinkAccent),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                      title: Text("Trang chủ"),
                      leading: Icon(Icons.home, color: Colors.red)),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                      title: Text('Tài khoản'),
                      leading: Icon(Icons.person, color: Colors.red)),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                      title: Text("Giỏ hàng"),
                      leading: Icon(Icons.shopping_basket, color: Colors.red)),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => new Cart()));
                  },
                  child: ListTile(
                      title: Text("Đặt hàng"),
                      leading: Icon(Icons.shopping_cart, color: Colors.red)),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                      title: Text('Quan tâm'),
                      leading: Icon(Icons.favorite, color: Colors.red)),
                ),
                Divider(),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                      title: Text('Cài đặt'), leading: Icon(Icons.settings)),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(title: Text('Hỗ trợ'), leading: Icon(Icons.help)),
                ),
                // body
              ],
            )),
        body: new Column(
          children: <Widget>[
            // image carousel begins here
            image_carousel,
            new Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: new Text('Loại sản phẩm')),
            ),

            // Horizontal list view begins here
            HorizontalList(),

            // padding widget
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child:  Container(
                  alignment: Alignment.centerLeft,
                  child: new Text('Sản phẩm mới')),
            ),

            // grid view
            Flexible(
              child: Products(),
            )
          ],
        ));
  }
}
