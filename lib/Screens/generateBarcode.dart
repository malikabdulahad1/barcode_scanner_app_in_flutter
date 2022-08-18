import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


class GenerateBarCode extends StatefulWidget {
   GenerateBarCode({Key? key}) : super(key: key);
    

  @override
  State<GenerateBarCode> createState() => _GenerateBarCodeState();
}

class _GenerateBarCodeState extends State<GenerateBarCode> {
final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(onPressed: (){Navigator.pop(context);} , child: Text('Back To selection', style: TextStyle(fontWeight: FontWeight.bold),)),
      ),
       appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.of(context).size.height * 0.2,    
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Generate BarCode',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),),
            Text('Enter Your Word in textfield',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Your Data',
                prefixIcon:Icon(Icons.data_array, color: Colors.blue,),
                suffixIcon: Icon(Icons.text_fields, color: Colors.blue,),
              ),
            ),
          ),
          CupertinoButton(
            color: Colors.blue,
            child: Text('Clear', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),), onPressed: () {
              setState(() {
                controller.clear();
              });
            },),
        SizedBox(
          height: 20,
        ),
        Text('Your Barcode wil Show Here', style: TextStyle(fontWeight: FontWeight.bold),),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey
            ),
            child: controller.text!=''?BarcodeWidget(
              backgroundColor: Colors.white,
              data: controller.text, barcode: Barcode.code128(), drawText: false,):Container(color: Colors.white,)
          ),
        ),
        ],
        
        
        ),
      ),
    );
  }

}
