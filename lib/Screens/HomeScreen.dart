import 'package:bar_code/Screens/generateBarcode.dart';
import 'package:bar_code/Screens/generatedQrCode.dart';
import 'package:bar_code/Screens/scanedbarcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String barcode = 'Unknown';
   String QRcode = 'Unknown';
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.2,    
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome to',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),),
            Text('BarCode Scanner App',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),),
          ],
        ),
      ),
      body: SafeArea(child: Column(
        children: [
          GestureDetector(
            onTap: () {
              scanBarcode();
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Scanedbarcode(scaned: barcode,);
              },));
            },
            child: ListTile(
              title: Text('Scan BarCode', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              subtitle: Text('Tap on it for Scan BarCode'),
              leading: SvgPicture.asset('assets/barcode.svg',height: 40, color: Colors.blue,width: 30,),
              trailing: Icon(Icons.arrow_circle_right_outlined, color: Colors.blue,),
            ),
          ),

                

                     GestureDetector(
                      onTap: () {
                        QRScan();
                      },
                       child: ListTile(
                                   title: Text('Scan QRCode', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                   subtitle: Text('Tap on it for Scan QRCode'),
                                   leading: SvgPicture.asset('assets/barcode.svg',height: 40, color: Colors.blue,width: 30,),
                                   trailing: Icon(Icons.arrow_circle_right_outlined, color: Colors.blue,),
                                 ),
                     ),

                         GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => GenerateBarCode(),));
                      },
                      child: ListTile(
                                title: Text('Generate BarCode', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                subtitle: Text('Tap on it for Generate BarCode'),
                                leading: SvgPicture.asset('assets/barcode.svg',height: 40, color: Colors.blue,width: 30,),
                        trailing: Icon(Icons.arrow_circle_right_outlined, color: Colors.blue,),
                    
                              ),
                    ),
                                             GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => GenerateQRCode(),));
                      },
                      child: ListTile(
                                title: Text('GenerateQRCode', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                subtitle: Text('Tap on it for Generate QRCode'),
                                leading: SvgPicture.asset('assets/barcode.svg',height: 40, color: Colors.blue,width: 30,),
                        trailing: Icon(Icons.arrow_circle_right_outlined, color: Colors.blue,),
                    
                              ),
                    ),
        ],
      )),
    );
  }


  Future<void> scanBarcode()async{
    String barcodeScanRes;
  try{
        barcodeScanRes =  await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.BARCODE);
  } on PlatformException {
    barcodeScanRes = 'Failed to get plateform';
  }
   if (!mounted) return ;
   setState(() {
      barcode = barcodeScanRes;

   });
  }

Future<void> QRScan()async{
  String QRScanRs;
  try{
QRScanRs = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);
  } on PlatformException{
  QRScanRs ='Failed to get plateform version';
  }
  if(mounted) return;
  setState(() {
    QRcode = QRScanRs;
  });
}
}


