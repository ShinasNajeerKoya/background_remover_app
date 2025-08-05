class PostgrestException implements Exception {
  String errorMessage;
  String? errorDescription;
  PostgrestException({required this.errorMessage, this.errorDescription});
}

class DriftErrorException implements Exception {
  String errorMessage;
  String? errorDescription;
  DriftErrorException({required this.errorMessage, this.errorDescription});
}


/// Custom exception for all API errors
class ApiException implements Exception {
  final String errorMessage;
  final int? statusCode;


  ApiException(this.errorMessage, {this.statusCode});

  @override
  String toString() => 'ApiException($statusCode): $errorMessage';
}