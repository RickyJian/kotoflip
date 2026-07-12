import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // Pixel 10 Pro dp 估算值（1280x2856px / 495ppi）
      designSize: const Size(427, 952),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'kotoflip',
          theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: navigate to create_card page
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
