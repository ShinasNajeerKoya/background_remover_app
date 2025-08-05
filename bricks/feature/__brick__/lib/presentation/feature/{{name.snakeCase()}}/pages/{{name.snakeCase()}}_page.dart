import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';


import 'package:get_it/get_it.dart' show GetIt;
import 'package:background_remover_app/presentation/feature/{{name.snakeCase()}}/bloc/{{name.snakeCase()}}_bloc.dart';
import 'package:background_remover_app/presentation/widgets/custom_app_bar.dart';


@RoutePage()
class {{name.pascalCase()}}Page extends StatelessWidget {
  static const id = '/{{name.camelCase()}}Page';
  {{name.pascalCase()}}Page({super.key});

  final {{name.camelCase()}}Bloc = GetIt.I<{{name.pascalCase()}}Bloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: '{{name.pascalCase()}} App Bar',
      ),
      body: Center(
        child: Text('{{name.pascalCase()}} Page'),
      ),
    );
  }
}
