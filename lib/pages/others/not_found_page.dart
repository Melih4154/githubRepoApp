import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  final String? route;
  const NotFoundPage(this.route, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Bu sayfa bulunamadı $route'),
      ),
    );
  }
}
