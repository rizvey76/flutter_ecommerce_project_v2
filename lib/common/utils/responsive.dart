
// class Responsive extends InheritedWidget {
//   final double height;
//   final double width;
//   const Responsive(
//       {Key? key,
//       required Widget child,
//       required this.height,
//       required this.width})
//       : super(key: key, child: child);
//   static Responsive of(BuildContext context) {
//     final Responsive? result =
//         context.dependOnInheritedWidgetOfExactType<Responsive>();
//     assert(result != null, 'No Responsive found in context');
//     return result!;
//   }

//   @override
//   bool updateShouldNotify(covariant Responsive oldWidget) {
//     // TODO: implement updateShouldNotify
//     return oldWidget.height != height || oldWidget.width != width;
//   }
// }
