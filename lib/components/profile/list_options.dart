import 'package:closeby/components/cb-components/list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<CBListOptions> settingsListOptions = <CBListOptions>[
  CBListOptions(
    () => null,
    FontAwesomeIcons.circleUser,
    'Personal info',
  ),
  CBListOptions(
    () => null,
    FontAwesomeIcons.creditCard,
    'Payments',
  ),
  CBListOptions(
    () => null,
    FontAwesomeIcons.language,
    'Translate',
  ),
  CBListOptions(
    () => null,
    FontAwesomeIcons.bell,
    'App settings',
  )
];

List<CBListOptions> helpListOptions = <CBListOptions>[
  CBListOptions(
    () => null,
    FontAwesomeIcons.circleQuestion,
    'How CloseBy works',
  ),
  CBListOptions(
    () => null,
    FontAwesomeIcons.diceD20,
    'How do we use Blockchain',
  ),
  CBListOptions(
    () => null,
    FontAwesomeIcons.pencil,
    'Send to us your feedback',
  ),
  CBListOptions(
    () => null,
    FontAwesomeIcons.heartPulse,
    'Ask for help',
  )
];

List<CBListOptions> legalListOptions = <CBListOptions>[
  CBListOptions(
    () => null,
    FontAwesomeIcons.scaleBalanced,
    'Terms and condition',
  ),
  CBListOptions(
    () => null,
    FontAwesomeIcons.scaleBalanced,
    'Privacy policy',
  ),
];