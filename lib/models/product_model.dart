class Product {
  final String name;
  final double price;
  final String imageUrl;
  // final int id;
  // final int idkategori;
  // final String judul;
  // final String harga;
  // final String hargax;
  // final String thumbnail;

  // Product({required this.id, required this.idkategori,required this.judul,required this.harga,required this.hargax,required this.thumbnail});
  const Product(
      {required this.name, required this.price, required this.imageUrl});

  static const List<Product> products = [
    Product(name: "Garam Dapur", price: 20.000, imageUrl: "https://tse4.mm.bing.net/th?id=OIP.JvCCulDAiA2xWYctAwuZBAHaHa&pid=Api&P=0&h=180"),
    Product(name: "Gula Pasir", price: 20.000, imageUrl: "https://tse4.mm.bing.net/th?id=OIP.yGIhdGBuIukKj7-Kgz_0tAHaHa&pid=Api&P=0&h=180"),
    Product(name: "Gula Merah", price: 20.000, imageUrl: "https://tse1.mm.bing.net/th?id=OIP.DgxIpmuw3CvhW22HkBuJigHaHa&pid=Api&P=0&h=180")
  ];

  // factory Product.fromJson(Map<String, dynamic> json) {
  //   return Product(
  //       id: json['id'] as int,
  //       idkategori: json['idkategori'] as int,
  //       judul: json['judul'] as String,
  //       harga: json['harga'] as String,
  //       hargax: json['hargax'] as String,
  //       thumbnail: json['thumbnail'] as String);
  // }
  // Map<String, dynamic> toMap() {
  //   Map<String, dynamic> map = Map<String, dynamic>();
  //   map['id'] = id;
  //   map['idkategori'] = idkategori;
  //   map['judul'] = judul;
  //   map['harga'] = harga;
  //   map['hargax'] = hargax;
  //   map['thumbnail'] = thumbnail;
  //   return map;
  // }
}
