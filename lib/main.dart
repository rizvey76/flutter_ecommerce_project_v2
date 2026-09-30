import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/common/utils/no_scollbar_behavior.dart';
import 'package:flutter_application_ecom/controllers/compared_product_controller.dart';
import 'package:flutter_application_ecom/controllers/popular_product_controller.dart';
import 'package:flutter_application_ecom/pages/splash/splash_screen.dart';
import 'package:flutter_application_ecom/presentation/shared/main_shell.dart';
import 'package:flutter_application_ecom/test_page/admin_page.dart';
import 'package:flutter_application_ecom/test_widgets/animeted_widget.dart';
import 'package:flutter_application_ecom/test_widgets/autoComplete_search/a_productSearch_page.dart';
import 'package:flutter_application_ecom/test_widgets/autoComplete_search/a_product_binding.dart';
import 'package:flutter_application_ecom/test_widgets/draggable_sheet.dart';
import 'package:flutter_application_ecom/test_widgets/expansion_panel.dart';
import 'package:flutter_application_ecom/test_widgets/explicit_animation.dart';
import 'package:flutter_application_ecom/test_widgets/focus_shortcuts_actions_intent/editor_page.dart';
import 'package:flutter_application_ecom/test_widgets/implicit_animation.dart';
import 'package:flutter_application_ecom/test_widgets/overlyPopup/home_page_overly.dart';
import 'package:flutter_application_ecom/test_widgets/overlyPopup/product_card.dart';
import 'package:flutter_application_ecom/test_widgets/scaffoldMessengerGlobal/home_page.dart';
import 'package:flutter_application_ecom/test_widgets/scaffoldMessengerGlobal/snackbar_Service.dart';
import 'package:flutter_application_ecom/test_widgets/scaffold_messenger_async.dart';
import 'package:flutter_application_ecom/test_widgets/segmentedButton/segmented_dependency.dart';
import 'package:flutter_application_ecom/test_widgets/segmentedButton/segmented_view.dart';
import 'package:flutter_application_ecom/test_widgets/shader_mask.dart';
import 'package:flutter_application_ecom/test_widgets/statefulBuilderFull/initial_bindings.dart';
import 'package:flutter_application_ecom/test_widgets/statefulBuilderFull/statefulBuilder_checkout_page.dart';
import 'package:flutter_application_ecom/test_widgets/slivers.dart';
import 'package:flutter_application_ecom/test_widgets/login_page_animated_switcher.dart';
import 'package:flutter_application_ecom/test_widgets/animated_positioned.dart';
import 'package:flutter_application_ecom/test_widgets/stream_listView.dart';
import 'package:flutter_application_ecom/test_widgets/custom_navigation.dart';
import 'package:flutter_application_ecom/test_widgets/credit_card_animated_container.dart';
import 'package:flutter_application_ecom/test_widgets/clip_r_rect_blur_card.dart';
import 'package:flutter_application_ecom/test_widgets/swing_animated_builder.dart';
import 'package:flutter_application_ecom/test_widgets/flicking_animation.dart';
import 'package:flutter_application_ecom/test_widgets/value_notifier.dart';
import 'package:flutter_application_ecom/test_widgets/list_with_animated_list_state.dart';
import 'package:flutter_application_ecom/test_widgets/tween_Animation.dart';
import 'package:get/get.dart';
// import 'helper/dependencies.dart' as dep;
import 'helper/dependenciesRev.dart' as devDep;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await devDep.initRev();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Get.find<PopularProductController>().getPopularProductList();
    // Get.find<ComparedProductController>().getComparedProductList();
    return  GetMaterialApp(
      title: 'Flutter Ecommerce',
      //temporay change to test the expansion panel widget
      scrollBehavior: NoScrollbarBehavior(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
       scaffoldMessengerKey: SnackbarService.messengerKey,
      // home: SplashScreen(),
      initialRoute: '/',
      initialBinding: SegmentedDependency(),
      onGenerateRoute: (settings) {
        // final size = MediaQuery.of(context).size;


        // test
      

        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => AnimatedPositionedExample());
            // return MaterialPageRoute(builder: (context) => SegmentedViewPage());
            //  return MaterialPageRoute(builder: (context) => ScaffoldMessengerAsync());

        // case '/application':q

        //   return MaterialPageRoute(
        //     builder: (context) => Responsive(
        //       height: size.height,
        //       width: size.width,
        //       child: ApplicationPage(),
        //     ),
        //   );
        // case '/category':
        //   return MaterialPageRoute(
        //     builder: (context) => Responsive(
        //       height: size.height,
        //       width: size.width,
        //       child: CategoryPage(),
        //     ),
        //   );
        // case '/favourite':
        //   return MaterialPageRoute(
        //     builder: (context) => Responsive(
        //       height: size.height,
        //       width: size.width,
        //       child: FavouritePage(),
        //     ),
        //   );
        // case '/home':
        //   return MaterialPageRoute(
        //     builder: (context) => Responsive(
        //       height: size.height,
        //       width: size.width,
        //       child: HomePage(),
        //     ),
        //   );
        // case '/menu':
        //   return MaterialPageRoute(
        //     builder: (context) => Responsive(
        //       height: size.height,
        //       width: size.width,
        //       child: MenuPage(),
        //     ),
        //   );
        // case '/cart':
        //   return MaterialPageRoute(
        //     builder: (context) => Responsive(
        //       height: size.height,
        //       width: size.width,
        //       child: CartPage(),
        //     ),
        //   );
        //   default:
        //     return MaterialPageRoute(
        //       builder: (context) => Scaffold(
        //         body: Center(child: Text('404 Page Not Found')),
        //       ),
        //     );
        // }




      //   if (settings.name == '/') {
      //     return MaterialPageRoute(builder: (context) => SplashScreen());
      //   }

      //  if (settings.name == '/admin') {
      //     return MaterialPageRoute(builder: (context) => AdminPage());
      //   }
      //   return null;




        // if (settings.name == '/category') {
        //   return MaterialPageRoute(builder: (context) => CategoryPage());
        // }
        // if (settings.name == '/menu') {
        //   return MaterialPageRoute(builder: (context) => MenuPage());
        // }

        ////////////////////////////////////////////////////

        // if (settings.name == '/page1') {
        //   return MaterialPageRoute(builder: (context) => PageOne());
        // }
        // if (settings.name == '/page2') {
        //   return MaterialPageRoute(builder: (context) => PageTwo());
        // }

        // if (settings.name == '/page3') {
        //   return MaterialPageRoute(builder: (context) => PageThree());
        // }
        // if (settings.name == '/page4') {
        //   return MaterialPageRoute(builder: (context) => PageFour());
        // }
        // if (settings.name == '/page5') {
        //   return MaterialPageRoute(builder: (context) => PageFive());
        // }
        // if (settings.name == '/page6') {
        //   return MaterialPageRoute(builder: (context) => PageSix());
        }
        return null;
      },
    );
  }
}
