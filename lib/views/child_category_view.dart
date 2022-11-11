import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../controller/category_controller.dart';
import '../utils/color_helper.dart';
import '../utils/image_helper.dart';

class ChildCategoryView extends StatefulWidget {
  const ChildCategoryView({Key? key}) : super(key: key);

  @override
  State<ChildCategoryView> createState() => _ChildCategoryViewState();
}

class _ChildCategoryViewState extends State<ChildCategoryView> {

  int specialIndex = Get.arguments[0];

  CategoryController categoryController = Get.put(CategoryController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.white,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: ColorHelper.white,
        automaticallyImplyLeading: false,
        elevation: 3.0,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: const Icon(Icons.arrow_back,size: 25,color: ColorHelper.black,),
        ),
        title: const Text(
          "Clothing Collection",
          style:  TextStyle(
            fontSize: 18,
            color: ColorHelper.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
          child: ScrollablePositionedList.builder(
            shrinkWrap: true,
            initialScrollIndex: specialIndex,
            itemCount: categoryController.categoryData.length,
            itemScrollController: itemScrollController,
            itemBuilder: (context, index) => cardWidget(index),
            itemPositionsListener: itemPositionsListener,
          ),
        ),
      ),
    );
  }


  Widget cardWidget(int parentIndex){
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorHelper.white,
          boxShadow: [
            BoxShadow(
              color: ColorHelper.black.withOpacity(0.01),
              spreadRadius: 10,
              blurRadius: 5,
              offset: const Offset(0, 7),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  categoryController.categoryData[parentIndex].name.toString(),
                  style:  const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: const [
                    Text(
                      "View All",
                      style:  TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5,),
                   Icon(Icons.arrow_forward,size: 20,color: ColorHelper.black,)
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10,),
            StaggeredGrid.count(
              crossAxisCount: 3,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
              children: List.generate(categoryController.categoryData[parentIndex].children!.length, (index) {
                return contentWidget(parentIndex,index);
              },
                growable: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget contentWidget(int parentIndex,int index){
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width*0.3,
      height: 130,
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: FadeInImage.assetNetwork(
                  width: 90,
                  height: 90,
                  placeholder: ImageHelper.loading,
                  fit: BoxFit.cover,
                  image: categoryController.categoryData[parentIndex].children![index].image.toString(),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: (){
                      debugPrint("print!");
                      _scaffoldKey.currentState!.showSnackBar(snack);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const SizedBox(width: 40,height: 40,),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            categoryController.categoryData[parentIndex].children![index].name.toString(),
            textAlign: TextAlign.center,
            maxLines: 2,
            style:  const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

 var snack =  const SnackBar(
      content: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.0,horizontal: 10),
        child: Text('Thank you for checking us out!',
          style: TextStyle(
          color: ColorHelper.white,
            fontSize: 16,
            fontWeight: FontWeight.normal,
        ),
        ),
      ),
      backgroundColor: ColorHelper.black,
      duration: Duration(seconds: 1),
    );

}
