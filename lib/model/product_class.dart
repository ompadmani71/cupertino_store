class Product {
  String title;
  int price;
  String images;

  Product({required this.title, required this.price, required this.images});

  static List<Product> productList = [
    Product(
      title: "Vagabond sack",
      price: 120,
      images: "assets/images/bag.jpeg"

    ),
    Product(
      title: "Stella sunglasses",
      price: 58,
      images: "assets/images/sunglases.jpg"
    ),
    Product(
      title: "Whitney belt",
      price: 35,
      images:"assets/images/belt.jpg"
    ),
    Product(
      title: "Garden strand",
      price: 98,
      images: "assets/images/chain.jpg"
    ),
    Product(
      title: "Strut earrings",
      price: 34,
      images: "assets/images/earrings.jpg"
    ),
    Product(
      title: "Varsity socks",
      price: 12,
      images: "assets/images/socks.jpg"
    ),
    Product(
      title: "Weave keyring",
      price: 16,
      images: "assets/images/keyring.jpg"
    ),

    Product(
      title: "White pinstripe shirt",
      price: 70,
      images: "assets/images/shirt5.jpg"
    ),
    Product(
      title: "Chambray shirt",
      price: 70,
      images: "assets/images/shirt1.jpg"
    ),
    Product(
      title: "Surf and perf shirt",
      price: 48,
      images: "assets/images/shirt2.jpg"
    ),
    Product(
      title: "Chambray shirt",
      price: 38,
      images: "assets/images/shirt3.jpg"
    ),
    Product(
      title: "Sunshirt dress",
      price: 58,
      images: "assets/images/shirt4.jpg"
    ),
  ];
}
