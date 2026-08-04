import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EditorController extends ChangeNotifier {
   final TextEditingController textController = TextEditingController();

   String? _message;
   String? get message => _message;

   void newFile() {
    textController.clear();
    _message = 'New file created';
    notifyListeners();
   }

   void save(){
    debugPrint('===========================');
    debugPrint('Document Content');
    debugPrint(textController.text);
    debugPrint('====================');

    _message = 'Document saved';
    notifyListeners();
   }


   void find(){
    _message = 'Find action triggered';
    notifyListeners();
   }

   void clearMessage(){
     _message = null;
   }

   @override
   void dispose() {
    textController.dispose();
    super.dispose();
   }
}