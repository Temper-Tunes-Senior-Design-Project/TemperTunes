import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:mood_swing/Utilities/BluetoothRouter.dart';
import 'MyPalette.dart';

class DevicePopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      child: Container(
        height: height * 0.3,
        width: width * 0.2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              color: MyPalette.brightMagenta,
              blurRadius: 16,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: StreamBuilder<List<DiscoveredDevice>>(
          stream: BluetoothRouter().getNearbyDevices(),
          builder: (context, snapshot) {
            List<DiscoveredDevice> devices = snapshot.data ?? [];
            return ListView.builder(
                itemCount: devices.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(devices[index].name),
                    onTap: () {
                      Navigator.pop(context, devices[index]);
                    },
                  );
                });
          },
        ),
      ),
    );
  }
}
