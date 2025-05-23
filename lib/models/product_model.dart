class Product{
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
});
  Map<String,dynamic>toMap(){
    return {
      'id':id,
      'name':name,
      'price':price,
      'imageUrl':imageUrl,
    };
  }
  factory Product.fromMap(Map<String,dynamic>map){
    return Product(
      id: map['id'],
      name: map['name'],
      price: double.parse(map['price'].toString()),
      imageUrl: map['imageUrl'],
    );
  }
}
