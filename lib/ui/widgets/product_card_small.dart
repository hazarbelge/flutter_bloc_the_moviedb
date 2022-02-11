import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCardSmall extends StatelessWidget {
  const ProductCardSmall({
    Key? key,
    this.onTap,
    required this.image,
    required this.title,
    required this.aspectRatio,
    required this.maxWidth,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String image;
  final String title;
  final double aspectRatio;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        child: Row(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
              height: ((Get.context?.width ?? Get.width) / aspectRatio) - 20,
              placeholder: (BuildContext context, String url) => Container(
                height: ((Get.context?.width ?? Get.width) / aspectRatio) - 20,
                width: 110,
                color: Colors.grey.shade600,
              ),
              errorWidget: (BuildContext context, String url, dynamic error) => const Icon(Icons.error),
            ),
            const SizedBox(width: 25),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: maxWidth / aspectRatio,
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
