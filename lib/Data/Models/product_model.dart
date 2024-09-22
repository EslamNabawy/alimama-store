class Product {
  final String name;
  final String description;
  final String image;
  final double price;
  final double rating;

  Product({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['title'],
      description: json['description'],
      image: json['image'],
      price: json['price'].toDouble(),
      rating: json['rating']['rate'].toDouble(),
    );
  }
}
