import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name.snakeCase()}}_state.freezed.dart';
part '{{name.snakeCase()}}_state.g.dart';

@freezed
abstract class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {
  const factory {{name.pascalCase()}}State({
    @Default(false) bool error,
    @Default(false) bool isLoading,
  }) = _{{name.pascalCase()}}State;

  factory {{name.pascalCase()}}State.fromJson(Map<String, dynamic> json) =>
      _${{name.pascalCase()}}StateFromJson(json);
}
