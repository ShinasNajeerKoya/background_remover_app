import 'package:background_remover_app/domain/repositories/onboarding/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  @override
  Future<void> completeOnboarding() async {
    await Future.delayed(Duration(milliseconds: 3000));
  }
}
