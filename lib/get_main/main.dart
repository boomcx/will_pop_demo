import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pop_scope_page_transitions/pop_scope_page_transitions.dart';
import 'package:will_pop_demo/get_main/routes/app_pages.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      backButtonDispatcher: MRootBackButtonDispatcher(),
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            // TargetPlatform.android: PopScopePageTransitionsBuilder(),
            TargetPlatform.iOS: PopScopePageTransitionsBuilder(),
          },
        ),
      ),
      // defaultTransition: Transition.cupertino,
      // customTransition: PopScopeCustomTransitionsBuilder(),
      // unknownRoute: AppPages.unknownRoute,
      // scrollBehavior: CustomScrollBehavior(),
    );
  }
}

class MRootBackButtonDispatcher extends BackButtonDispatcher
    with WidgetsBindingObserver {
  /// Create a root back button dispatcher.
  MRootBackButtonDispatcher();


  @override
  void addCallback(ValueGetter<Future<bool>> callback) {
    if (!hasCallbacks) {
      WidgetsBinding.instance.addObserver(this);
    }
    super.addCallback(callback);
  }

  @override
  void removeCallback(ValueGetter<Future<bool>> callback) {
    super.removeCallback(callback);
    if (!hasCallbacks) {
      WidgetsBinding.instance.removeObserver(this);
    }
  }

  @override
  Future<bool> didPopRoute() async {
    final maybePop = await Get.rawRoute?.navigator?.maybePop();
    return maybePop ?? invokeCallback(Future.value(false));
  }
}
