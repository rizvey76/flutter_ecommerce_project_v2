import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/test_widgets/focus_shortcuts_actions_intent/editor_controller.dart';
import 'package:flutter_application_ecom/test_widgets/focus_shortcuts_actions_intent/find_intent.dart';

class FindAction extends Action<FindIntent> {
  FindAction(this.controller);

  final EditorController controller;

  @override
  Object? invoke(covariant FindIntent intent) {
    controller.find();
    return null;
  }
}