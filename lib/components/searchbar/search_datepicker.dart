import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:flutter/material.dart';

Future<DateTimeRange?> searchDatePickerRange(BuildContext context) async {
  return await showDateRangePicker(
    context: context,
    helpText: '',
    saveText: 'Done',
    firstDate: DateTime.now(),
    lastDate: DateTime(DateTime.now().year + 10),
    initialEntryMode: DatePickerEntryMode.calendarOnly,
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
            appBarTheme: const AppBarTheme(
              elevation: 0,
            ),
            textTheme: TextTheme(
              bodyMedium: AppFonts.figtree(
                  color: AppColor.primaryBlack,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
              headlineSmall: AppFonts.montserrat(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
            colorScheme: ColorScheme.dark(
              primary: AppColor.primaryBlack,
              onPrimary: AppColor.offWhite,
              surface: AppColor.offWhite,
              onSurface: AppColor.primaryBlack,
            ),
            dialogBackgroundColor: AppColor.offWhite),
        child: child!,
      );
    },
  );
}
