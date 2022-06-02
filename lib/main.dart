import 'package:flutter/material.dart';
import 'package:qr_code_generator/ui/style/style.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String data = "";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppStyle.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: QrImage(
              data: data,
              backgroundColor: Colors.white,
              version: QrVersions.auto,
            size: 243.0,
            ),
          ),
          SizedBox(height: 24.0,
          ),
          Container(
            width: 300.0,

            child: TextField(
              onChanged: (value){
                setState((){
                  data = value;
                });
              },
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(

                hintText: "Type the Data",
                filled: true,
                fillColor: AppStyle.textInputColor,
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 24.0,),
          RawMaterialButton(
            fillColor: AppStyle.accentColor,
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(horizontal: 36.0,vertical: 10.0),
            onPressed: (){},
            child: Text("Generate QR code"),
          )
        ],
      ),
    );
  }
}
