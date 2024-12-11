import 'package:get/get.dart';
import 'package:will_pop_demo/get_main/pages/home/home.dart';
import 'package:will_pop_demo/get_main/pages/second/second.dart';
import 'package:will_pop_demo/get_main/pages/third/third.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = kRouteHome;

  static final routes = [
    GetPage(
      name: kRouteHome,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: kRouteSecond,
        page: () => const SecondView(),
        binding: SecondBinding(),
        children: [
          GetPage(
            name: kRouteThirdName,
            page: () => const ThirdView(),
            binding: ThirdBinding(),
          ),
        ]),
    // GetPage(
    //   name: kRouteThird,
    //   page: () => const ThirdView(),
    //   binding: ThirdBinding(),
    // ),
  ];
}
