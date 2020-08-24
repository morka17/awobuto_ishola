import 'package:awobuto_ishola/services/product_entry.dart';

import 'package:awobuto_ishola/product_data.dart';

import 'package:awobuto_ishola/widgets/products_catogeries.dart';
import 'package:flutter/material.dart';

import 'package:firebase/firebase.dart' as fb;

import 'widgets/drawer.dart';
import 'package:awobuto_ishola/views/add_product.dart';
import 'package:awobuto_ishola/views/homeview.dart';
import 'package:awobuto_ishola/widgets/product_card.dart';

import 'package:provider/provider.dart';

import 'services/product_entry.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static String productCat = 'Shirt';
  List<bool> _selections =
      List.generate(CategoriesList.length, (index) => false);
  var productEntries =
      // ignore: top_level_function_literal_block
      fb.firestore().collection(productCat).onSnapshot.map((snapshot) {
    return snapshot.docs.map((e) => ProductEntry.fromMap(e.data())).toList();
  });

  void getProduct(String products) {
    setState(() {
      productCat = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<ProductEntry>>(
      create: (_) => productEntries,
      child: MaterialApp(
        title: 'Awobutu Ishola',
        initialRoute: MyHomePage.id,
        routes: {
          PostView.id: (context) => PostView(),
          HomeView.id: (context) => HomeView(),
          // HomeTest.id: (context) => HomeTest(),
          MyHomePage.id: (context) => MyHomePage(
                drawer: Drawer(
                  child: DrawerContent(
                    shirt: () {
                      getProduct('Shirt');
                      Navigator.pop(context);
                    },
                    shoe: () {
                      getProduct('Shoes');
                      Navigator.pop(context);
                    },
                    trouser: () {
                      getProduct('Trouser');
                      Navigator.pop(context);
                    },
                    trainer: () {
                      getProduct('Trainer');
                      Navigator.pop(context);
                    },
                    bags: () {
                      getProduct('Bags');
                      Navigator.pop(context);
                    },
                    short: () {
                      getProduct('Shorts');
                      Navigator.pop(context);
                    },
                    tshirt: () {
                      getProduct('T-Shirt');
                      Navigator.pop(context);
                    },
                    jeans: () {
                      getProduct('Jeans');
                      Navigator.pop(context);
                    },
                  ),
                ),
                selections: _selections,
                toggleButton: (int index) {
                  if (index == 0) {
                    getProduct('Shoes');
                  } else if (index == 1) {
                   getProduct('Shirt');
                  } else if (index == 3) {
                    getProduct('T-Shirt');
                  } else if (index == 4) {
                    getProduct('Trouser');
                  } else if (index == 5) {
                    getProduct('Shorts');
                  } else if (index == 6) {
                    getProduct('Jeans');
                  } else if (index == 7) {
                    getProduct('Trainer');
                  } else if (index == 8) {
                    getProduct('Bags');
                  }
                },
              ),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const String id = '/Home';
  final Drawer drawer;
  final Function toggleButton;
  final List<bool> selections;
  const MyHomePage({Key key, this.drawer, this.toggleButton, this.selections})
      : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  getProduct(List<ProductEntry> productEntries) {
    if (productEntries != null) {
      for (var productEntry in productEntries) {
        print(productEntry.productDiscript);
      }
      productEntries.forEach((element) {
        itemsData.add(ProductCard(
          productEntry: element,
        ));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      double value = controller.offset / 119;
      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final productEntries = Provider.of<List<ProductEntry>>(context);
    final Size size = MediaQuery.of(context).size;
    for (var productEntry in productEntries) {
      print(productEntry);
    }
    final double categoryHeight = size.height * 0.30;
    getProduct(productEntries);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: widget.drawer,
        appBar: AppBar(
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
        body: Container(
          height: size.height,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 15,
              ),
              Container(
                // height: 50.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child: Icon(
                            Icons.call,
                            color: Colors.blue,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: SelectableText(
                            '+39 351 028 0086',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 35.0),
                          child: Icon(
                            Icons.mail,
                            color: Colors.blue,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: SelectableText(
                            'AwobutuIshola@gmail.com',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.only(right: 50.0),
                alignment: Alignment.topRight,
                child: Text(
                  "Menu",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: closeTopContainer ? 0 : 1,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: size.width,
                  alignment: Alignment.topCenter,
                  height: closeTopContainer ? 0 : categoryHeight,
                  child: CategoriesScroller(
                    selection: widget.selections,
                    toggleButton: widget.toggleButton,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: controller,
                  itemCount: itemsData.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return itemsData[index];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
