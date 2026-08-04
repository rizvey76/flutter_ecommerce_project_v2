import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_ecom/test_widgets/focus_shortcuts_actions_intent/editor_controller.dart';
import 'package:flutter_application_ecom/test_widgets/focus_shortcuts_actions_intent/find_action.dart';
import 'package:flutter_application_ecom/test_widgets/focus_shortcuts_actions_intent/find_intent.dart';
import 'package:flutter_application_ecom/test_widgets/focus_shortcuts_actions_intent/new_file_action.dart';
import 'package:flutter_application_ecom/test_widgets/focus_shortcuts_actions_intent/new_file_intent.dart';
import 'package:flutter_application_ecom/test_widgets/focus_shortcuts_actions_intent/save_action.dart';
import 'package:flutter_application_ecom/test_widgets/focus_shortcuts_actions_intent/save_intent.dart';

class EditorPage extends StatefulWidget {
  const EditorPage({super.key});

  @override
  State<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  late final EditorController controller;
  @override
  void initState() {
     super.initState();
    controller = EditorController();
    controller.addListener(_handeleControllerChanges);
   
  }

  void _handeleControllerChanges() {
    if(!mounted) return;
    final message = controller.message;

    if(message == null) return;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );

    controller.clearMessage();
  }

  @override
  void dispose() {
    controller.removeListener(_handeleControllerChanges);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: const <ShortcutActivator, Intent>{
        SingleActivator(LogicalKeyboardKey.keyN, control: true): NewFileIntent(),
        SingleActivator(LogicalKeyboardKey.keyS, control: true): SaveIntent(),
        SingleActivator(LogicalKeyboardKey.keyF, control: true): FindIntent(),
      },
      child: Actions(
        actions: {
          SaveIntent: SaveAction(controller),
          NewFileIntent: NewFileAction(controller),
          FindIntent: FindAction(controller),
        }, 
        child: Focus(
          autofocus: true,
          child: Builder(
            builder:(context) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Editor Page')),
                  body: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                Actions.invoke(context, NewFileIntent(),
                                );
                              }, 
                              icon: const Icon(Icons.note_add),
                              label: const Text('New File'),),


                            const SizedBox(width: 12),
                          ElevatedButton.icon(
                            onPressed: () {
                              Actions.invoke(
                                context,
                                const SaveIntent(),
                              );
                            },
                            icon: const Icon(Icons.save),
                            label: const Text('Save'),
                          ),

                          const SizedBox(width: 12),
                          ElevatedButton.icon(
                            onPressed: () {
                              Actions.invoke(
                                context,
                                const FindIntent(),
                              );
                            },
                            icon: const Icon(Icons.search),
                            label: const Text('Find'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: TextField(
                          controller: controller.textController,
                          expands: true,
                          maxLines: null,
                          textAlignVertical: TextAlignVertical.top,
                          decoration: const InputDecoration(
                            hintText: 'Type something...',
                            border: OutlineInputBorder(),
                          ),
                        ),
                          
                        ),
                      ]
                    ),
               
                  ),
              );
            },
          ),
        ),
      ),
    );
  }
}