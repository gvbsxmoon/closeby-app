import 'package:closeby/locale/en_US.dart';
import 'package:closeby/locale/it_it.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Locales extends Translations {
  static const Locale defaultLocale = Locale('en', 'EN');
  
  static const List<Locale> supportedLocales = [
    Locale('it', 'IT'),
    Locale('en', 'EN')
  ];

  @override
  Map<String, Map<String, String>> get keys =>
      {'en_US': languageEN, 'it_IT': languageIT};
}