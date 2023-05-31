import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String thumb;
  final double width;
  final double? height;
  final Duration fadeDuration;
  const ImageView({
    super.key,
    required this.thumb,
    required this.width,
    this.height,
    this.fadeDuration = Duration.zero,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: CachedNetworkImage(
        width: width,
        height: height ?? width,
        fadeInDuration: fadeDuration,
        fadeOutDuration: fadeDuration,
        imageUrl: thumb,
        placeholder: (context, url) => Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
          ),
        ),
      ),
    );
  }
}
