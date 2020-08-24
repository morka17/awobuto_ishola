import 'package:flutter/material.dart';

const KinputDecoration = InputDecoration(
    hintText: "First Name",
    focusColor: Colors.green,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlue, width: 1.0),
    ),
    border: OutlineInputBorder(borderRadius: BorderRadius.horizontal()),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green, width: 2.0)));

const kLabel = TextStyle(
  fontWeight: FontWeight.bold,
);




// class MyApp extends StatelessWidget {
//   static int productLength;
//   final productEntries = fb.firestore().collection('Shirt').onSnapshot
//       // ignore: top_level_function_literal_block
//       .map((snapshot) {
//     productLength = snapshot.docs.length;
//     return snapshot.docs.map((e) => ProductEntry.fromMap(e.data())).toList();
//   });

//   @override
//   Widget build(BuildContext context) {
//     print(productEntries);
//     return StreamProvider<List<ProductEntry>>(
//       create: (_) => productEntries,
//       child: MaterialApp(
//           title: 'Awobutu Ishola',
//           initialRoute: HomeTest.id,
//           routes: {
//             MyHomePage.id: (context) => MyHomePage(),
//             PostView.id: (context) => PostView(),
//             HomeView.id: (context) => HomeView(),
//             HomeTest.id: (context) => HomeTest(),
//           }),
//     );
//   }
// }
// class HomeTest extends StatefulWidget {
//   static const String id = '/homeTest';
//   @override
//   _HomeTestState createState() => _HomeTestState();
// }

// class _HomeTestState extends State<HomeTest> {
//   List<Widget> itemsData = [];

//   ScrollController controller;
//   getProduct(List<ProductEntry> productEntries) {
//     if (productEntries != null) {
//       for (var productEntry in productEntries) {
//         print(productEntry.productDiscript);
//       }
//       productEntries.forEach((element) {
//         itemsData.add(ProductCard(
//           productEntry: element,
//         ));
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final productEntries = Provider.of<List<ProductEntry>>(context);
//     getProduct(productEntries);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product'),
//       ),
//       body: SafeArea(
//           child: Container(
//         child: Expanded(
//           child: ListView.builder(
//             controller: controller,
//             itemCount: itemsData.length,
//             physics: BouncingScrollPhysics(),
//             itemBuilder: (context, index) {
//               return itemsData[index];
//             },
//           ),
//         ),
//       )),
//     );
//   }
// }
