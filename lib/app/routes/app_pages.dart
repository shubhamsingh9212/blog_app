import 'package:get/get.dart';

import '../modules/authentication/bindings/authentication_binding.dart';
import '../modules/authentication/views/authentication_view.dart';
import '../modules/blog_detail_screen/bindings/blog_detail_screen_binding.dart';
import '../modules/blog_detail_screen/views/blog_detail_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/my_blogs/bindings/my_blogs_binding.dart';
import '../modules/my_blogs/views/my_blogs_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/upload_blog/bindings/upload_blog_binding.dart';
import '../modules/upload_blog/views/upload_blog_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTHENTICATION;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => const AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.BLOG_DETAIL_SCREEN,
      page: () => const BlogDetailScreenView(),
      binding: BlogDetailScreenBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_BLOG,
      page: () =>  UploadBlogView(),
      binding: UploadBlogBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.MY_BLOGS,
      page: () => const MyBlogsView(),
      binding: MyBlogsBinding(),
    ),
  ];
}
