class ProductEntry {
  final String productName;
  final String productDiscript;
  final String productPrice;
  final String productImageUrl;

  ProductEntry(
      {this.productName,
      this.productImageUrl,
      this.productDiscript,
      this.productPrice, });

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'productDiscript': productDiscript,
      'productPrice': productPrice,
      'productImageUrl': productImageUrl,
    };
  }

  static ProductEntry fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ProductEntry(
      productName: map['productName'],
      productDiscript: map['productDiscript'],
      productPrice: map['productPrice'],
      productImageUrl: map['productImageUrl']
    );
  }

  @override
  String toString() => 'ProductEntry productName:$productName, productDiscript:$productDiscript, productPrice:$productPrice, productImageUrl:$productImageUrl';
  
}
