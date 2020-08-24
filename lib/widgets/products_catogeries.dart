import 'package:flutter/material.dart';
import 'package:awobuto_ishola/product_data.dart';

class CategoriesScroller extends StatefulWidget {
  final Function toggleButton;
  final List<bool> selection;

  const CategoriesScroller({Key key, this.toggleButton, this.selection}) : super(key: key);
  @override
  _CategoriesScrollerState createState() => _CategoriesScrollerState();
}

class _CategoriesScrollerState extends State<CategoriesScroller> {
  Widget categoriesList(double categoryHeight) {

    List<dynamic> productList = CategoriesList;
    List<Widget> productCategories = [];
    productList.forEach((productElement) {
      productCategories.add(
        Material(
          elevation: 4.0,
          child: Card(
            child: Container(
              width: 150,
              margin: EdgeInsets.only(right: 20),
              height: categoryHeight,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/${productElement["image"]}'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      productElement["name"],
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });

    return ToggleButtons(
      children: productCategories,
      isSelected: widget.selection,
      selectedBorderColor: Colors.green,
      renderBorder: false,
//      onPressed: (int index) {
//        print('hello world!');
//        setState(() {
//          _selections[index] = !_selections[index];
//        });
//      },
     onPressed: widget.toggleButton,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 40;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
            fit: BoxFit.fill,
            alignment: Alignment.topCenter,
            child: categoriesList(categoryHeight)),
      ),
    );
  }
}
