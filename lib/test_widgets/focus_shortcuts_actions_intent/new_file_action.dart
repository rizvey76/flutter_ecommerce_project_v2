



import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/test_widgets/focus_shortcuts_actions_intent/editor_controller.dart';
import 'package:flutter_application_ecom/test_widgets/focus_shortcuts_actions_intent/new_file_intent.dart';

class NewFileAction extends Action<NewFileIntent> {
  NewFileAction(this.controller);

  final EditorController controller;

  @override
  Object? invoke(covariant NewFileIntent intent) {
    controller.newFile();
    return null;
  }
}