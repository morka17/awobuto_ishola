import 'dart:async';

import 'package:awobuto_ishola/constant.dart';
import 'package:awobuto_ishola/services/product_entry.dart';

import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:mime_type/mime_type.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:path/path.dart';

import '../main.dart';

class PostView extends StatefulWidget {
  static const String id = '/post';
  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  String _myActivity;
  String productCategorie;
  String productName;
  String productDiscript;
  String productPrice;
  dynamic productImageUrl;
  bool shouldLoad = false;
  final formKey = new GlobalKey<FormState>();
  FocusNode _focusNode = FocusNode();
  ScrollController _scrollController = ScrollController();
  TextEditingController _nameEditingController = TextEditingController();
  TextEditingController _discriptEditingController = TextEditingController();
  TextEditingController _priceEditingController = TextEditingController();

  Future _getProductImage() async {
    return ImagePickerWeb.getImageInfo.then((MediaInfo mediaInfo) {
      uploadFile(mediaInfo, 'product Image', mediaInfo.fileName);
    });
  }

  Future uploadFile(MediaInfo mediaInfo, String ref, String fileName) async {
    setState(() {
      shouldLoad = true;
    });
    try {
      String mimeType = mime(basename(mediaInfo.fileName));
      var metaData = fb.UploadMetadata(contentType: mimeType);
      StorageReference storageReference = fb.storage().ref(ref).child(fileName);

      UploadTaskSnapshot uploadTaskSnapshot =
          await storageReference.put(mediaInfo.data, metaData).future;

      Uri imageUri = await uploadTaskSnapshot.ref.getDownloadURL();
      if (imageUri != null) {
        setState(() {
          shouldLoad = false;
        });
      }
      print(imageUri);
      setState(() {
        productImageUrl = imageUri.toString();
      });
    } catch (e) {
      print('File Upload Error${e.toString()}');
      return null;
    }
  }

  _showErrAlert(String errMess, context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error...'),
          content: Center(
            child: Text(errMess),
          ),
        );
      },
    );
  }

  Widget productImage() {
    if (productImageUrl == null) {
      if (shouldLoad == true) {
        return Center(
          child: LinearProgressIndicator(
            backgroundColor: Color(0xFFffffff),
          ),
        );
      }
      return Icon(
        Icons.image,
        size: 40.0,
      );
    }
    return Image.network(
      productImageUrl,
      fit: BoxFit.fill,
    );
  }

  Widget productLabel(String label) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        label,
        textAlign: TextAlign.left,
        style: kLabel,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _myActivity = '';
  }

  @override
  Widget build(BuildContext context) {
    Widget productImageBox = productImage();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pushNamed(context, MyHomePage.id),
        ),
        centerTitle: true,
        title: Text(' Add Product.'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 5.0),
                child: DropDownFormField(
                  titleText: 'Product Categories',
                  hintText: 'Please choose your Product Categorie',
                  value: _myActivity,
                  onSaved: (value) {
                    setState(() {
                      _myActivity = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _myActivity = value;
                      productCategorie = _myActivity;
                    });
                  },
                  dataSource: [
                    {"display": "Shoes", "value": "Shoes"},
                    {"display": "Shirt", "value": "Shirt"},
                    {"display": "T-Shirt", "value": "T-Shirt"},
                    {"display": "Trouser", "value": "Trouser"},
                    {"display": "Shorts", "value": "Shorts"},
                    {"display": "Bags", "value": "Bags"},
                    {"display": "Jeans", "value": "Jeans"},
                    {"display": "Trainer", "value": "Trainer"},
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Product Image*',
                style: kLabel,
              ),
              GestureDetector(
                onTap: () {
                  _getProductImage();
                },
                child: Container(
                  decoration: BoxDecoration(color: Colors.lightBlueAccent),
                  width: MediaQuery.of(context).size.width / 2 - 20,
                  height: 155.0,
                  child: productImageBox,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Column(
                  children: [
                    productLabel('Product Name*'),
                    Container(
                      height: 40.0,
                      child: TextField(
                        controller: _nameEditingController,
                        focusNode: _focusNode,
                        textInputAction: TextInputAction.none,
                        onChanged: (value) => productName = value,
                        decoration: KinputDecoration.copyWith(
                          hintText: 'Product Name',
                          alignLabelWithHint: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Column(
                  children: [
                    productLabel('Product Discription*'),
                    Container(
                      child: TextField(
                        controller: _discriptEditingController,
                        minLines: 4,
                        maxLength: 40,
                        maxLines: null,
                        textInputAction: TextInputAction.none,
                        onChanged: (value) => productDiscript = value,
                        decoration: KinputDecoration.copyWith(
                          hintText: 'Product Discription',
                          alignLabelWithHint: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 6.0,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    productLabel("Product Price\ \$:*"),
                    Container(
                      alignment: Alignment.topLeft,
                      height: 30.0,
                      width: 150.0,
                      child: TextField(
                        controller: _priceEditingController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) => productPrice = value.toString(),
                        decoration: KinputDecoration.copyWith(
                          hintText: 'Product Price',
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                          alignLabelWithHint: true,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10.0),
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
                        backgroundColor: Colors.green,
                        child: Icon(Icons.add),
                        onPressed: () {
                          var db = fb.firestore();
                          if (productCategorie == null) {
                            _showErrAlert('Select Product Categories', context);
                          } else if (productName == null) {
                            _showErrAlert('Enter Product Name', context);
                          } else if (productDiscript == null) {
                            _showErrAlert('Enter product discription', context);
                          } else if (productPrice == null) {
                            _showErrAlert('Enter product price', context);
                          } else if (productImageUrl == null) {
                            _showErrAlert('Select product image', context);
                          }

                          if (productCategorie != null &&
                              productDiscript != null &&
                              productImageUrl != null &&
                              productName != null &&
                              productPrice != null) {
                            final productData = ProductEntry(
                              productDiscript: productDiscript,
                              productImageUrl: productImageUrl,
                              productName: productName,
                              productPrice: productPrice,
                            );
                            try {
                              db
                                  .collection(productCategorie)
                                  .add(productData.toMap());
                              showCupertinoDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text('Go to Home page.'),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, MyHomePage.id);
                                        },
                                        child: Text('Yes'),
                                      ),
                                      FlatButton(
                                        onPressed: () {
                                          _nameEditingController.clear();
                                          _priceEditingController.clear();
                                          _discriptEditingController.clear();
                                          setState(() {
                                            productImageUrl = null;
                                          });
                                        },
                                        child: Text('No'),
                                      )
                                    ],
                                  );
                                },
                              );
                            } catch (e) {
                              print('undefined ${e.toString()}');
                            }
                          }
                        },
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
