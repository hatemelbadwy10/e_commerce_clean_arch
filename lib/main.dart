import 'package:flutter/material.dart';
import 'core/utils/service_locator.dart';
import 'features/home/presentation/views/home_view.dart';

void main() async {
  await setup();
  runApp(const ECommerce());
}
class ECommerce extends StatelessWidget {
  const ECommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeView(),
    );
  }
}
