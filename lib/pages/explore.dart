import 'package:closeby/components/cb-components/wrapper.dart';
import 'package:closeby/components/cb-navigation/header.dart';
import 'package:closeby/components/product/product_card.dart';
import 'package:flutter/material.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    return const CBWrapper(
      margin: true,
      header: Header(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            ProductCard(),
          ],
        ),
      ),
    );
  }
}

