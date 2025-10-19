import 'dart:io';

import 'package:fruits_dashboard/features/products/data/models/review_model.dart';
import 'package:fruits_dashboard/features/products/domain/entities/product_input_entity.dart';

class ProductInputModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final List<ReviewModel> reviews;

  ProductInputModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.isFeatured,
    this.imageUrl,
    required this.expirationMonths,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviews,
  });

  factory ProductInputModel.fromEntity(ProductInputEntity entity) {
    return ProductInputModel(
      name: entity.name,
      code: entity.code,
      description: entity.description,
      price: entity.price,
      image: entity.image,
      isFeatured: entity.isFeatured,
      imageUrl: entity.imageUrl,
      expirationMonths: entity.expirationMonths,
      isOrganic: entity.isOrganic,
      numberOfCalories: entity.numberOfCalories,
      unitAmount: entity.unitAmount,
      reviews: entity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationMonths': expirationMonths,
      'isOrganic': isOrganic,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
