import 'package:flutter/material.dart';

import 'customize_tile.dart';

class DrawerContent extends StatelessWidget {
final Function shoe, shirt, tshirt, trouser, short, bags, jeans ,trainer;

  const DrawerContent({Key key, this.shoe, this.shirt, this.tshirt, this.trouser, this.short, this.bags, this.jeans, this.trainer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF193044),
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[Colors.green, Colors.blue],
              ),
            ),
            child: CircleAvatar(
              radius: 360.0,
              backgroundImage: AssetImage('images/logo.jpg'),
            ),
          ),
          CustomizeTile(
            icon: Icons.shopping_cart,
            text: 'Shoes',
            ontap: shoe,
          ),
          CustomizeTile(
            icon: Icons.settings,
            text: 'Shirt',
            ontap: shirt,
          ),
          CustomizeTile(
            icon: Icons.shopping_cart,
            text: 'T-Shirt',
            ontap: tshirt ,
          ),
          CustomizeTile(
            icon: Icons.shopping_cart,
            text: 'Trousers',
            ontap: trouser,
          ),
          CustomizeTile(
            icon: Icons.shop_two,
            text: 'Jeans',
            ontap: jeans,
          ),
          CustomizeTile(
            icon: Icons.shopping_basket,
            text: 'Trainer',
            ontap: trainer,
          ),
          CustomizeTile(
            icon: Icons.add_shopping_cart,
            text: 'Short Trousers',
            ontap: short,
          ),
          CustomizeTile(
            icon: Icons.shopping_basket,
            text: 'Bags',
            ontap: bags,
          ),
        ],
      ),
    );
  }
}


// shoe: () {
              //   setState(() {
              //     productEntry = fb
              //         .firestore()
              //         .collection('Shoes')
              //         .onSnapshot
              //         .map((snapshot) {
              //       return snapshot.docs
              //           .map((e) => ProductEntry.fromMap(e.data()))
              //           .toList();
              //     });
              //   });
              //   Navigator.pop(context);
              // },
              // shirt: () {
              //   setState(() {
              //     productEntry = fb
              //         .firestore()
              //         .collection('Shirt')
              //         .onSnapshot
              //         .map((snapshot) {
              //       return snapshot.docs
              //           .map((e) => ProductEntry.fromMap(e.data()))
              //           .toList();
              //     });
              //   });
              //   Navigator.pop(context);
              // },
              // tshirt: () {
              //   setState(() {
              //     productEntry = fb
              //         .firestore()
              //         .collection('T-Shirt')
              //         .onSnapshot
              //         .map((snapshot) {
              //       return snapshot.docs
              //           .map((e) => ProductEntry.fromMap(e.data()))
              //           .toList();
              //     });
              //   });
              //   Navigator.pop(context);
              // },
              // trouser: () {
              //   setState(() {
              //     productEntry = fb
              //         .firestore()
              //         .collection('Trouser')
              //         .onSnapshot
              //         .map((snapshot) {
              //       return snapshot.docs
              //           .map((e) => ProductEntry.fromMap(e.data()))
              //           .toList();
              //     });
              //   });
              //   Navigator.pop(context);
              // },
              // short: () {
              //   setState(() {
              //     productEntry = fb
              //         .firestore()
              //         .collection('Shorts')
              //         .onSnapshot
              //         .map((snapshot) {
              //       return snapshot.docs
              //           .map((e) => ProductEntry.fromMap(e.data()))
              //           .toList();
              //     });
              //   });
              //   Navigator.pop(context);
              // },
              // jeans: () {
              //   setState(() {
              //     productEntry = fb
              //         .firestore()
              //         .collection('Jeans')
              //         .onSnapshot
              //         .map((snapshot) {
              //       return snapshot.docs
              //           .map((e) => ProductEntry.fromMap(e.data()))
              //           .toList();
              //     });
              //   });
              //   Navigator.pop(context);
              // },
              // trainer: () {
              //   setState(() {
              //     productEntry = fb
              //         .firestore()
              //         .collection('Trainer')
              //         .onSnapshot
              //         .map((snapshot) {
              //       return snapshot.docs
              //           .map((e) => ProductEntry.fromMap(e.data()))
              //           .toList();
              //     });
              //   });
              //   Navigator.pop(context);
              // },
              // bags: () {
              //   setState(() {
              //     productEntry = fb
              //         .firestore()
              //         .collection('Bags')
              //         .onSnapshot
              //         .map((snapshot) {
              //       return snapshot.docs
              //           .map((e) => ProductEntry.fromMap(e.data()))
              //           .toList();
              //     });
              //   });
              //   Navigator.pop(context);
              // },