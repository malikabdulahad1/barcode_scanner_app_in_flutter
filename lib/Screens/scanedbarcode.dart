import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Scanedbarcode extends StatefulWidget {
 
   String? scaned = '';
Scanedbarcode({this.scaned});
  @override
  State<Scanedbarcode> createState() => _ScanedbarcodeState();
}

class _ScanedbarcodeState extends State<Scanedbarcode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [
        Text(widget.scaned!),
      ],)),
    );
  }
}