import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_nike_store/Core/Constants/icon_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../Core/Constants/app_colors.dart';
import '../../Data/Models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double oldPrice = product.price * 1.2;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.borderColor, width: 2),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(13),
                      topRight: Radius.circular(13),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: product.image,
                      fit: BoxFit.cover,
                      height: 117,
                      width: double.infinity,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: double.infinity,
                          height: 117,
                          color: Colors.white,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Positioned(
                    top: 7,
                    right: 7,
                    child: SvgPicture.asset(
                      IconPaths.favIcon,
                      height: 27,
                      width: 27,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.description.length > 50
                          ? '${product.description.substring(0, 50)}...'
                          : product.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontFamily: 'Roboto',
                        color: AppColors.textColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'EGP ${product.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            color: AppColors.textColor,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'EGP ${oldPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            color: AppColors.secondaryTextColor,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Review (${product.rating})',
                          style: const TextStyle(
                            fontSize: 13,
                            fontFamily: 'Roboto',
                            color: AppColors.textColor,
                          ),
                        ),
                        const SizedBox(width: 5),
                        SvgPicture.asset(
                          IconPaths.starIcon,
                          height: 15,
                          width: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: SvgPicture.asset(
              IconPaths.addIcon,
              height: 30,
              width: 30,
            ),
          ),
        ],
      ),
    );
  }
}
