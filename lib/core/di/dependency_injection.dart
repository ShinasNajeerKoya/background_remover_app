// core/di/injector.dart

import 'package:background_remover_app/data/repositories/home/home_repository_impl.dart';
import 'package:background_remover_app/domain/repositories/home/home_repository.dart';
import 'package:background_remover_app/presentation/feature/home/bloc/home_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:background_remover_app/data/repositories/onboarding/onboarding_repository_impl.dart';
import 'package:background_remover_app/domain/repositories/onboarding/onboarding_repository.dart';
import 'package:background_remover_app/domain/repositories/ostrum_comments/ostrum_comments_repository.dart';
import 'package:background_remover_app/presentation/feature/onboarding/bloc/onboarding_bloc.dart';

import '../../data/repositories/ostrum_comments/ostrum_comments_repository_impl.dart';
import '../../data/services/comment_service/comment_service.dart';
import '../../presentation/feature/ostrum_comments/bloc/ostrum_comments_bloc.dart';
import '../network/api_client.dart';
import '../routes/route_config.dart';

final getIt = GetIt.instance;

class GetItHelper {
  static void init() {
    /// AppRouter
    getIt.registerSingleton<AppRouter>(AppRouter());

    /// Dio instance with headers
    getIt.registerSingleton<Dio>(Dio(BaseOptions(headers: {'User-Agent': 'Flutter-App'})));

    /// ApiClient using the Dio instance
    getIt.registerSingleton<ApiClient>(ApiClient(dio: getIt<Dio>()));

    /// service
    getIt.registerSingleton<OstrumCommentService>(OstrumCommentService(getIt<ApiClient>()));

    /// Repositories -- add after each feature generation
    getIt.registerSingleton<OnboardingRepository>(OnboardingRepositoryImpl());
    getIt.registerSingleton<OstrumCommentsRepository>(OstrumCommentsRepositoryImpl(getIt<OstrumCommentService>()));
    getIt.registerSingleton<HomeRepository>(HomeRepositoryImpl());

    /// BloCs -- add after each feature generation
    getIt.registerSingleton<OnboardingBloc>(OnboardingBloc(getIt<OnboardingRepository>()));
    getIt.registerSingleton<OstrumCommentsBloc>(OstrumCommentsBloc(getIt<OstrumCommentsRepository>()));
    getIt.registerSingleton<HomeBloc>(HomeBloc(getIt<HomeRepository>()));
  }

  void dispose() {
    // optional: clear bloc states or dispose streams if needed
  }
}
