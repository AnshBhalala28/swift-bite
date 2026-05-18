import 'dart:ui';

class BannerModel {
  final String title;
  final String imageUrl;
  final VoidCallback onTap;

  BannerModel({
    required this.title,
    required this.imageUrl,
    required this.onTap,
  });
}