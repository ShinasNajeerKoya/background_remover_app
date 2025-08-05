// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:background_remover_app/presentation/feature/home/pages/home_page.dart'
    as _i1;
import 'package:background_remover_app/presentation/feature/onboarding/pages/onboarding_page.dart'
    as _i2;
import 'package:background_remover_app/presentation/feature/ostrum_comments/pages/ostrum_comments_page.dart'
    as _i3;
import 'package:flutter/material.dart' as _i5;

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomePage();
    },
  );
}

/// generated route for
/// [_i2.OnboardingPage]
class OnboardingRoute extends _i4.PageRouteInfo<OnboardingRouteArgs> {
  OnboardingRoute({_i5.Key? key, List<_i4.PageRouteInfo>? children})
    : super(
        OnboardingRoute.name,
        args: OnboardingRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'OnboardingRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OnboardingRouteArgs>(
        orElse: () => const OnboardingRouteArgs(),
      );
      return _i2.OnboardingPage(key: args.key);
    },
  );
}

class OnboardingRouteArgs {
  const OnboardingRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'OnboardingRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OnboardingRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i3.OstrumCommentsPage]
class OstrumCommentsRoute extends _i4.PageRouteInfo<void> {
  const OstrumCommentsRoute({List<_i4.PageRouteInfo>? children})
    : super(OstrumCommentsRoute.name, initialChildren: children);

  static const String name = 'OstrumCommentsRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.OstrumCommentsPage();
    },
  );
}
