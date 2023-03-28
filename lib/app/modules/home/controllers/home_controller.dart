import 'package:blog_app/app/data/firebase_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/global_widgets/indicator.dart';
import '../../../models/blog_models.dart';

class HomeController extends GetxController {
  final FirebaseFunctions _functions = FirebaseFunctions();
  final ScrollController controller = ScrollController();
  List<BlogModel> blogs = [];
  var isLoading = false.obs;

  void getData() async{
    blogs.clear();
    Indicator.showLoading();
    List<BlogModel> blogsData = await _functions.getBlogs();
    blogs.addAll(blogsData);
    Indicator.closeLoading();
    update();
  }

  @override
  void onReady(){
    super.onReady();
    getData();
  }

}
