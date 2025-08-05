import 'package:flutter/material.dart';

class {{name.pascalCase()}}Widget extends StatelessWidget {
  const {{name.pascalCase()}}Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('{{name.pascalCase()}} Widget'),
      ),
    );
  }
}
