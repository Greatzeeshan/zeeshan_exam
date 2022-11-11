import 'package:get/get.dart';

import '../model/category_model.dart';
import '../service/category_service.dart';

class CategoryController extends GetxController{
  var isLoading = false.obs;
  var categoryData = <Category>[];

  getCategoryData() async {
    isLoading(true).obs;
    try {
      isLoading(true);
      categoryData.clear();
      var temp = await CategoryService.getCategory();
      if(temp != null){
        categoryData = temp.categories!;
        return categoryData;
      }
    } finally {
      isLoading(false);
    }
  }

}