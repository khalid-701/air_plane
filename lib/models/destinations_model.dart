import 'package:equatable/equatable.dart';

class DestinationsModel extends Equatable {
  final String id;
  final String name;
  final String city;
  final String imageUrl;
  final String interest;
  final double rating;
  final int price;
  final String about;
  final String photos;

  DestinationsModel(
      {required this.id,
      this.name = '',
      this.city = '',
      this.imageUrl = '',
      this.interest = '',
      this.rating = 0.0,
      this.price = 0,
      this.about = '',
      this.photos = ''});

  factory DestinationsModel.fromJson(String id, Map<String, dynamic> json) =>
      DestinationsModel(
        id: id,
        name: json['name'],
        city: json['city'],
        imageUrl: json['imageUrl'],
        interest: json['interest'],
        rating: json['rate'],
        price: json['price'],
        about: json['about'],
        photos: json['photos'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name' : name,
    'city': city,
    'imageUrl' : imageUrl,
    'rating' : rating,
    'price' : price,
  };

  @override
  List<Object?> get props => [
        id,
        name,
        city,
        imageUrl,
        interest,
        rating,
        price,
        about,
        photos,
      ];
}
