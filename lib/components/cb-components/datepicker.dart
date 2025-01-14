import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<DateTimeRange?> showCBDatePicker(BuildContext context) async {
  return await showDateRangePicker(
    context: context,
    helpText: '',
    saveText: 'done'.tr,
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
              ),
              headlineSmall:
                  AppFonts.figtree(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            colorScheme: ColorScheme.dark(
              primary: AppColor.primaryBlack,
              onPrimary: AppColor.offWhite,
              surface: AppColor.offWhite,
              onSurface: AppColor.primaryBlack,
              secondary: AppColor.rebeccaPurple.withOpacity(0.3),
            ),
            dialogBackgroundColor: AppColor.offWhite),
        child: child!,
      );
    },
  );
}
