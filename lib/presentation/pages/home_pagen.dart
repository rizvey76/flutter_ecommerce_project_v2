import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/presentation/views/desktop_view.dart';
import 'package:flutter_application_ecom/presentation/views/mobile_view.dart';
import 'package:flutter_application_ecom/presentation/views/tablet_view.dart';
import 'package:flutter_application_ecom/responsive/responsive_builder.dart';

class HomePageN extends StatelessWidget {
  const HomePageN({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveBuilder(
      mobile: HomeMobileView(), 
      tablet: HomeTabletView(), 
      desktop: HomeDesktopView()
      );
  }
}