import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  static const String id = '/Welcome';
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      backgroundColor: Color(0xFFFFFFFF),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black54),
        elevation: 3,
        backgroundColor: Colors.white,
        title: Container(
          child: Row(
            children: <Widget>[
              Container(
                height: 40.0,
                width: 50.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('images/logo.jpg'),
                  fit: BoxFit.fill,
                )),
              ),
              Text(
                " Awobuto Ishola",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 22),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              color: Color(0xffed4368),
              width: double.infinity,
              height: MediaQuery.of(context).size.height/2 + 20,
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 8.0),
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(
                              'Welcome to',
                              style: TextStyle(
                                fontFamily: 'OdibeeSans',
                                fontSize: 32.0,
                                color: Color(0xFFe4e727),
                              ),
                            ),
                            Text(
                              'Awobuto Ishola',
                              style: TextStyle(
                                fontSize: 32.0,
                                color: Color(0xFF4b4c5c)
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Get the most Affordable and\n good looking clothes accessories.\n Beautiful and well Finished Designs',
                          style: TextStyle(
                            color: Color(0xFF88d2f8),
                            fontSize: 20.0
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child:  Container(
                      height: 100.0,
                      width: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/t-shirt.jpeg'),
                              fit: BoxFit.fill,
                            )
                          ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
