import 'package:flutter/material.dart';

import '../Utilities/BluetoothRouter.dart';
class BluetoothLoaderPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Found Devices"),
          StreamBuilder(
            stream: BluetoothRouter().getNearbyDevices(),
              builder: (context,snapshot){
              print(snapshot.data);
                return Text("Item #");
          })
        ],
      ),
    );
  }

}