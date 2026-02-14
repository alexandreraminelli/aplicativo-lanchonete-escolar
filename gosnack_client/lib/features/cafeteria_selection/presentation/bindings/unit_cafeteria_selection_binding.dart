import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gosnack_client/features/cafeteria_selection/data/datasources/remote/cafeteria_firestore_datasource.dart';
import 'package:gosnack_client/features/cafeteria_selection/data/datasources/remote/unit_firestore_datasource.dart';
import 'package:gosnack_client/features/cafeteria_selection/data/datasources/local/unit_cafeteria_local_datasource.dart';
import 'package:gosnack_client/features/cafeteria_selection/data/repositories/unit_cafeteria_repository_impl.dart';
import 'package:gosnack_client/features/cafeteria_selection/domain/repositories/unit_cafeteria_repository.dart';
import 'package:gosnack_client/features/cafeteria_selection/domain/use_cases/get_cafeterias_by_unit_usecase.dart';
import 'package:gosnack_client/features/cafeteria_selection/domain/use_cases/get_units_usecase.dart';
import 'package:gosnack_client/features/cafeteria_selection/domain/use_cases/select_cafeteria_usecase.dart';
import 'package:gosnack_client/features/cafeteria_selection/presentation/controllers/unit_cafeteria_selection_controller.dart';

/// Binding para injeção de dependências do módulo de seleção de
/// unidade e lanchonete.
class UnitCafeteriaSelectionBinding extends Bindings {
  // -- Dependencies Injection ---------------------------------------------- //

  @override
  void dependencies() {
    // Injetar Data Sources
    Get.lazyPut(() => UnitCafeteriaSelectLocalDatasource(GetStorage()));
    final firestore = FirebaseFirestore.instance;
    Get.lazyPut(() => UnitFirestoreDataSource(firestore));
    Get.lazyPut(() => CafeteriaFirestoreDataSource(firestore));

    // Injetar repositório
    Get.lazyPut<UnitCafeteriaRepository>(
      () => UnitCafeteriaRepositoryImpl(Get.find(), Get.find(), Get.find()),
    );

    // Injetar Use Cases
    Get.lazyPut(() => GetUnitsUseCase(Get.find()));
    Get.lazyPut(() => GetCafeteriasByUnitUseCase(Get.find()));
    Get.lazyPut(() => SelectCafeteriaUseCase(Get.find()));

    // Injetar Controlador
    Get.lazyPut(
      () =>
          UnitCafeteriaSelectionController(Get.find(), Get.find(), Get.find()),
    );
  }
}
