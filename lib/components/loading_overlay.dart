import 'package:flutter/material.dart';
import 'package:youtube_clone/themes/color.dart';

class LoadingOverlay extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const LoadingOverlay({ 
    Key? key, 
    required this.child, 
    this.isLoading = false, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(isLoading) {
      return Center(
        child: CircularProgressIndicator(color: white,),
      );
    }
    return child;
  }
}