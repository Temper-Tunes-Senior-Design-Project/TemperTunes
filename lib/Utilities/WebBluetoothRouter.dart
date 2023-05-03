import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_web_bluetooth/flutter_web_bluetooth.dart';
import 'package:flutter_web_bluetooth/js_web_bluetooth.dart';

class WebBluetoothRouter {
  BluetoothDevice? device = null;
  final betterOptions = RequestOptionsBuilder([
    RequestFilterBuilder(
        namePrefix: "Spencer's",
        services: ["0d637d60-606c-11ed-9b6a-0242ac120002"])
  ]);

  Future<Stream<Future<double>>?> connectToDevice() async {
    final isAvailable = FlutterWebBluetooth.instance.isAvailable;
    if (await isAvailable.first) {
      try {
        device =
            await FlutterWebBluetooth.instance.requestDevice(betterOptions);
        await device?.connect();
        await Future.delayed(Duration(seconds: 3));
        return device?.services.map((event) async {
          BluetoothCharacteristic? char =
              (await event[0].getCharacteristics())[0];
          await char
              .writeValueWithoutResponse(Uint8List.fromList(utf8.encode("1")));
          await Future.delayed(Duration(seconds: 3));
          ByteData? b = await char.readValue();
          return double.parse(utf8.decode(b.buffer.asUint8List()));
        });
      } on UserCancelledDialogError {
        // The user cancelled the dialog
      } on DeviceNotFoundError {
        // There is no device in range for the options defined above
      } on SecurityError {
      } on BrowserError {
      } on Error catch (e) {
        print(e);
      }
    }
    return null;
  }
}
