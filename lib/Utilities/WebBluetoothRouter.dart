import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_web_bluetooth/flutter_web_bluetooth.dart';
import 'package:flutter_web_bluetooth/js_web_bluetooth.dart';

class WebBluetoothRouter {

  BluetoothDevice? device = null;

  void getWebDevices() async {
    final isAvailable = await FlutterWebBluetooth.instance.isAvailable;
    isAvailable.listen((available) async {
      if (available) {
        final betterOptions = RequestOptionsBuilder([
          RequestFilterBuilder(
              namePrefix: "Spencer's",
              services: ["0d637d60-606c-11ed-9b6a-0242ac120002"])
        ]);
        try {
          device =
              await FlutterWebBluetooth.instance.requestDevice(betterOptions);
          print("Assigned device");
          print(device);
        } on UserCancelledDialogError {
          // The user cancelled the dialog
        } on DeviceNotFoundError {
          print("Bad2");
          // There is no device in range for the options defined above
        } on SecurityError {
        } on BrowserError {
        } on Error catch (e) {
          print(e);
        }
      }
    });
  }

  void writeToDevice() async {
    print(device);
    await device?.connect();
    print(await device?.discoverServices());
    device?.services.listen((event) async {
      BluetoothCharacteristic? char = (await event[0].getCharacteristics())[0];
      char.writeValueWithoutResponse(Uint8List.fromList(utf8.encode("on")));
      print("Written");
    });
  }

  void readFromDevice() async {
    print(device.toString());
    await device?.connect();
    print(await device?.discoverServices());
    device?.services.listen((event) async {
      BluetoothCharacteristic? char = (await event[0].getCharacteristics())[0];
      print(await char.readValue());
      //ByteData? b = await char?.readValue();
      print("Read");
      // print(b?.buffer.asUint8List());
    });
  }
}
