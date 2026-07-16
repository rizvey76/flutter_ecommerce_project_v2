import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/responsive/breakpoints.dart';

class ResponsiveBuilder extends StatelessWidget{
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context){
    final width = MediaQuery.sizeOf(context).width;

    if(width < AppBreakpoints.compact){
      return mobile;
    }

    if(width < AppBreakpoints.expanded){
      return tablet;
    }

  return desktop;

  }
}