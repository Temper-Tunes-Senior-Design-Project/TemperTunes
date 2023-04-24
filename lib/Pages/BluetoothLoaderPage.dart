import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

import '../Utilities/BluetoothRouter.dart';
class BluetoothLoaderPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Found Devices"),
          StreamBuilder<Map<String,DiscoveredDevice>>(
            stream: BluetoothRouter().getNearbyDevices(),
              builder: (context,snapshot){

                return Container(
                  height: 750,
                  child: ListView.builder(
                      itemCount: snapshot.data?.length??0,
                      itemBuilder: (context,i)
                  {
                    return ListTile(
                      title: Text(snapshot.data?.entries.toList()[i].value.name??"No data"),
                    );
                  }),
                );
          })
        ],
      ),
    );
  }

}