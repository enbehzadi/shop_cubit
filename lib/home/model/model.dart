class rating{
  final num  rate;
  final num count;
  rating({this.rate, this.count});
  factory rating.fromJson(Map<String, dynamic> json) => rating(
      rate: json['rate'],
      count: json['count']
  );

}
class ProductModel {
  final int id;
  final String title, description,category,image;
  final num  price;
  final rating rat;
  ProductModel({this.id, this.title,this.price, this.description,this.category,this.image,this.rat});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'],
      title: json['title'],
      price : json['price'] ,
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rat: rating.fromJson(json['rating'] as Map<String, dynamic>));
}
