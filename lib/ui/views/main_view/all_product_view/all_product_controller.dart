import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/data/models/apis/category_model.dart';
import 'package:store/core/data/repositories/category_repository.dart';
import 'package:store/core/enums/message_type.dart';
import 'package:store/core/services/base_controller.dart';
import 'package:store/ui/shared/custom_widgets/custom_toast.dart';

class AllProductController extends BaseController {
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  TextEditingController searchController = TextEditingController();
  Rx<String> goal = "".obs;
  @override
  void onInit() {
    getAllGategory();

    super.onInit();
  }

  List<CategoryModel> search() {
    RxList<CategoryModel> results = <CategoryModel>[].obs;
    if (goal.isEmpty) {
      results.value = categoryList;
    } else {
      results.value = categoryList
          .where((p0) => p0.title!.toLowerCase().contains(goal.toLowerCase()))
          .toList();
    }
    return results;
  }

  void getAllGategory() {
    runFutureFunction(
        function: CategoryRepository().getAll().then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        categoryList.addAll(r);
      });
    }));
  }
}
