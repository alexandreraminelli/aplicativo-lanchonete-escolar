import 'package:gosnack_client/features/onboarding/data/datasources/onboarding_local_datasource.dart';
import 'package:gosnack_client/features/onboarding/domain/interfaces/onboarding_repository.dart';

/// Implementação concreta do repositório de onboarding.
class OnBoardingRepositoryImpl implements OnBoardingRepository {
  // -- Private Instance Variables ------------------------------------------ //

  // -- Datasources
  final OnBoardingLocalDatasource _localDatasource;

  // -- Public Constructor -------------------------------------------------- //

  OnBoardingRepositoryImpl(this._localDatasource);

  // -- Public Override Methods --------------------------------------------- //

  @override
  bool isFirstTime() {
    return _localDatasource.isFirstTime();
  }

  @override
  Future<void> setFirstTimeFalse() {
    return _localDatasource.setFirstTimeFalse();
  }
}
