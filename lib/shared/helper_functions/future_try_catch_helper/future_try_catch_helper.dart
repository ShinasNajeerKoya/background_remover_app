import 'package:flutter/material.dart';

import '../exception_helper.dart';

typedef FutureFunction = Future<void> Function();

class TryCatchError {
  final dynamic error;
  final StackTrace stackTrace;
  final String message;

  TryCatchError({required this.error, required this.stackTrace, required this.message});
}

/// A generic utility to wrap any async function in a robust try-catch block.
Future<void> futureTryCatch(
  FutureFunction fun, {
  Future<void> Function()? onBefore, // optional loading logic
  Future<void> Function()? onAfter, // optional stop loading
  Function(TryCatchError error)? onError, // custom error handling
  bool logging = true,
}) async {
  try {
    if (onBefore != null) await onBefore();

    await fun();
  } on ApiException catch (error, stack) {
    _handleError(error: error, message: error.errorMessage, stack: stack, logging: logging, onError: onError);
  } on PostgrestException catch (error, stack) {
    _handleError(
      error: error,
      message: error.errorMessage ?? 'Supabase error',
      stack: stack,
      logging: logging,
      onError: onError,
    );
  } on DriftErrorException catch (error, stack) {
    _handleError(error: error, message: error.errorMessage, stack: stack, logging: logging, onError: onError);
  } catch (error, stack) {
    _handleError(error: error, message: error.toString(), stack: stack, logging: logging, onError: onError);
  } finally {
    if (onAfter != null) await onAfter();
  }
}

void _handleError({
  required dynamic error,
  required String message,
  required StackTrace stack,
  required bool logging,
  Function(TryCatchError error)? onError,
}) {
  final tryError = TryCatchError(error: error, stackTrace: stack, message: message);

  if (onError != null) {
    onError(tryError);
  }

  if (logging) {
    debugPrint('[❌ TryCatch Error] $message');
    debugPrint(stack.toString());
    // integrate Crashlytics or Sentry if needed
  }
}
