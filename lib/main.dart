import 'package:closeby/router/router.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await initializeDateFormatting('en_EN', null);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: GetMaterialApp(
          initialRoute: AppRouter.initialRoute,
          getPages: AppRouter.routes,
          title: 'Closeby',
          theme: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          debugShowCheckedModeBanner: false,
        )

        /* MaterialApp.router(
        
      ), */
        );
  }
}
