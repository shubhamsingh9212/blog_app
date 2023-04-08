import 'package:blog_app/app/data/firebase_functions.dart';
import 'package:blog_app/app/data/global_widgets/indicator.dart';
import 'package:blog_app/app/models/blog_models.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class MyBlogsController extends GetxController {
  final FirebaseFunctions _functions = FirebaseFunctions();

  List blogsId = [];
  List<BlogModel> myBlogs = [];

  void getMyBlogData() async {
    blogsId = await _functions.getMyBlogs();
    if (blogsId.isNotEmpty) {
      for (var i = 0; i < blogsId.length; i++) {
        BlogModel model = await _functions.getBlogsById(blogsId[i]);
        myBlogs.add(model);
      }
    }
    update();
    Indicator.closeLoading();
  }

  void deleteBlog(String id) async {
    Indicator.showLoading();

    await _functions.deleteBlog(id).then((value) {
      myBlogs= [];
      getMyBlogData();
    });
    Indicator.closeLoading();
  }

  void editBlog(BlogModel model){
    Get.toNamed(Routes.UPLOAD_BLOG, arguments: model);

  }






  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMyBlogData();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    Indicator.showLoading();
  }
}
