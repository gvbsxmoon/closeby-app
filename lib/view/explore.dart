import 'package:closeby/components/cb-components/wrapper.dart';
import 'package:closeby/components/searchbar/searchbar.dart';
import 'package:flutter/material.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    return const CBWrapper(
      child: Searchbar(),
    );
  }
}
