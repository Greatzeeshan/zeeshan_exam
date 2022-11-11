import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeeshan_exam/utils/color_helper.dart';

import '../controller/category_controller.dart';
import '../utils/image_helper.dart';
import 'child_category_view.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {

  CategoryController categoryController = Get.put(CategoryController());

  @override
  void initState() {
    super.initState();
    categoryController.getCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx((){
        if(categoryController.isLoading.value == true){
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              LinearProgressIndicator()
            ],
          );
        }else{
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20,),
                  const Text(
                    "Category",
                    style:  TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'WaterBrush',
                    ),
                  ),
                  const SizedBox(height: 20,),
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: categoryController.categoryData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return categoryWidget(index);
                    },
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }

  Widget categoryWidget(int index){
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: InkWell(
        onTap: (){
          Get.to(() => const ChildCategoryView(),arguments: [index]);
        },
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorHelper.white,
            boxShadow: [
              BoxShadow(
                color: ColorHelper.black.withOpacity(0.02),
                spreadRadius: 10,
                blurRadius: 5,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      height: 75,
                      width: 75,
                      color: ColorHelper.white,
                      child: FadeInImage.assetNetwork(
                        placeholder: ImageHelper.loading,
                        fit: BoxFit.cover,
                        image: categoryController.categoryData[index].image.toString(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Text(
                    categoryController.categoryData[index].name.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(
                ImageHelper.arrow,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
