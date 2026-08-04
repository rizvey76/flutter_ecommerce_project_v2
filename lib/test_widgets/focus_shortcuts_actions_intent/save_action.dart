import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/test_widgets/focus_shortcuts_actions_intent/editor_controller.dart';
import 'package:flutter_application_ecom/test_widgets/focus_shortcuts_actions_intent/save_intent.dart';

class SaveAction extends Action<SaveIntent> {

  SaveAction(this.controller);

  final EditorController controller;

  @override
  Object? invoke(covariant SaveIntent intent) {
     controller.save();
     return null;
  }

  
}




