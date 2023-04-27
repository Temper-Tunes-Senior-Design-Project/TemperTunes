import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class BluetoothRouter {
  final FlutterReactiveBle bluetoothDriver = FlutterReactiveBle();

  Stream<List<DiscoveredDevice>> getNearbyDevices() {
    Map<String, DiscoveredDevice> devices = new Map<String, DiscoveredDevice>();
    return bluetoothDriver.scanForDevices(
        withServices: [], scanMode: ScanMode.lowLatency).map((event) {
      devices[event.id] = event;
      return devices.entries
          .where((element) => element.value.name != "")
          .map((e) => e.value)
          .toList();
    });
  }

  void writeToDevice(DiscoveredDevice device) async {
    // print(device);
    // await device?.connect();
    // print(await device?.discoverServices());
    // device?.services.listen((event) async {
    //   BluetoothCharacteristic? char = (await event[0].getCharacteristics())[0];
    //   char.writeValueWithoutResponse(Uint8List.fromList(utf8.encode("on")));
    //   print("Written");
    // });
  }

  void readFromDevice() async {
    // print(device.toString());
    // await device?.connect();
    // print(await device?.discoverServices());
    // device?.services.listen((event) async {
    //   BluetoothCharacteristic? char = (await event[0].getCharacteristics())?[0];
    //   print(await char?.readValue());
    //   //ByteData? b = await char?.readValue();
    //   print("Read");
    //   // print(b?.buffer.asUint8List());
    // });
  }
}
