import 'package:flutter/material.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({ Key? key }) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Library Page")),
    );
  }
}