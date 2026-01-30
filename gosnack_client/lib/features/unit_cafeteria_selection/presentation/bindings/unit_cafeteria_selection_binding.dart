import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/data/datasources/firestore/cafeteria_firestore_datasource.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/data/datasources/firestore/unit_firestore_datasource.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/data/repositories/cafeteria_repository_impl.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/data/repositories/unit_repository_impl.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/interfaces/cafeteria_repository.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/interfaces/unit_repository.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/use_cases/get_cafeterias_by_unit_usecase.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/domain/use_cases/get_units_usecase.dart';
import 'package:gosnack_client/features/unit_cafeteria_selection/presentation/controllers/unit_cafeteria_selection_controller.dart';

/// Binding para injeção de dependências do módulo de seleção de
/// unidade e lanchonete.
class UnitCafeteriaSelectionBinding extends Bindings {
  // -- Dependencies Injection ---------------------------------------------- //

  @override
  void dependencies() {
    // Injetar Data Sources do Firestore
    final firestore = FirebaseFirestore.instance;

    Get.lazyPut(() => UnitFirestoreDataSource(firestore));
    Get.lazyPut(() => CafeteriaFirestoreDataSource(firestore));

    // Injetar repositórios
    Get.lazyPut<UnitRepository>(() => UnitRepositoryImpl(Get.find()));
    Get.lazyPut<CafeteriaRepository>(() => CafeteriaRepositoryImpl(Get.find()));

    // Injetar Use Cases
    Get.lazyPut(() => GetUnitsUseCase(Get.find()));
    Get.lazyPut(() => GetCafeteriasByUnitUseCase(Get.find()));

    // Injetar Controlador
    Get.lazyPut(() => UnitCafeteriaSelectionController(Get.find(), Get.find()));
  }
}
