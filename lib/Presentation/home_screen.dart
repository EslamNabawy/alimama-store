import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Core/Constants/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ProductCard(),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
   ProductCard({
    super.key,
  });
  String? productName;
  String? productDescription;
  String? productImage;
  double? productPrice;
  double? productRating;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.borderColor, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(13),
                  topRight: Radius.circular(13),
                ),
                child: Image.asset(
                  'assets/Placeholder/placeholder.webp',
                  fit: BoxFit.cover,
                  height: 117,
                  width: double.infinity,
                ),
              ),
              Positioned(
                top: 7,
                right: 7,
                child: SvgPicture.asset(
                  'assets/Icons/fav_icon.svg', // Your SVG path
                  height: 27,
                  width: 27,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Product Name',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Roboto', // Apply Roboto font
                    fontWeight: FontWeight.bold, // Make it bold for emphasis
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Description goes here.',
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Roboto',
                    color: Colors.grey, // Use grey for secondary text
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '\$99.99',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500, // Semi-bold for price
                    color: AppColors.addButtonColor, // Apply your custom color
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Rating: 4.5/5',
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Roboto',
                    color: Colors.amber, // Rating color (yellow)
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
