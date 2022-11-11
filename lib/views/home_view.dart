import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../controller/user_controller.dart';
import '../utils/image_helper.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  UserDataController userDataController = Get.put(UserDataController());

  @override
  void initState() {
    super.initState();
    userDataController.fetchUserData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Obx((){
            if(userDataController.isLoading.value == true){
              return const Center(child: CircularProgressIndicator());
            }else{
              return
                userDataController.userData.data!.isNotEmpty ?
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   const SizedBox(height: 20,),
                   const Text(
                     "The Brand Ambassadors",
                     style: TextStyle(
                       fontSize: 25,
                       fontWeight: FontWeight.bold,
                       fontFamily: 'WaterBrush',
                     ),
                   ),
                   const SizedBox(height: 20,),
                   StaggeredGrid.count(
                     crossAxisCount: 2,
                     mainAxisSpacing: 8,
                     crossAxisSpacing: 6,
                     children: List.generate(userDataController.userData.data!.length, (index) {
                       return userWidget(index);
                     },
                       growable: true,
                     ),
                   ),
                 ],
               ),
             )
                 : Container();
            }
          }),
        )
    );
  }

  Widget userWidget(int index){
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: FadeInImage.assetNetwork(
            width: size.width*0.45,
            height: 200,
            placeholder: ImageHelper.loading,
            fit: BoxFit.cover,
            image: userDataController.userData.data![index].avatar.toString(),
          ),
        ),
        Text(
          userDataController.userData.data![index].firstName.toString(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'WaterBrush',
          ),
        ),
        Text(
          userDataController.userData.data![index].lastName.toString(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

}
