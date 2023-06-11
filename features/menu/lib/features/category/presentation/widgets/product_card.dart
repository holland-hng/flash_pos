import 'package:core_data/core_data.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
  });

  final Product product;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: onTap,
      child: Ink(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              width: 0.2,
              color: const Color.fromARGB(255, 224, 224, 224),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: ImageView(thumb: product.thumb, width: 250),
              ),
              12.0.vertical,
              Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.typo.body1.semiBold,
              ),
              const Spacer(),
              Text(
                '\$ ${product.price}',
                maxLines: 1,
                style: context.typo.body1.semiBold.mergeStyle(
                  color: Colors.green,
                ),
              ),
            ],
          )),
    );
  }
}
