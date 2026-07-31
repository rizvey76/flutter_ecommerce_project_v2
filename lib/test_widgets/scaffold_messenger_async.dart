import 'package:flutter/material.dart';

class ScaffoldMessengerAsync extends StatefulWidget {
  @override
  _ScaffoldMessengerAsyncState createState() => _ScaffoldMessengerAsyncState();
}

class _ScaffoldMessengerAsyncState extends State<ScaffoldMessengerAsync> {
  bool _isLoading = false;

  Future<bool> saveProfile() async {
    //simulate an api request
    await Future.delayed(const Duration(seconds: 4));
    return true;
  }

  Future<void> _handleSave() async {
    setState(
      (){
        _isLoading = true;
      }
    );

    try{
      final success = await saveProfile();

      if(!mounted){
        return;
      } else{
        ScaffoldMessenger.of(context)
             ..hideCurrentSnackBar()
             ..showSnackBar(
              SnackBar(
                content: Text(success ? 'Profile saved!' : 'Failed to save profile.'),
                   backgroundColor: success ? Colors.green : Colors.red,
              ),
          
             );
        
      }
    } catch(e){
      if(!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
          backgroundColor: Colors.red,
        )
      );
    } finally {
      if(!mounted) return;

      setState(() {
        _isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text('ScaffoldMessenger Async Example'),),

      body: Center(
        child: _isLoading ? const CircularProgressIndicator() : ElevatedButton(
          onPressed: _handleSave,
          child: const Text('Save Profile'),
        ),
      ),
    );
  }
}