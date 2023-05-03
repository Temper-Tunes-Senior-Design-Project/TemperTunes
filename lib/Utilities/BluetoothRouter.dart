import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'dart:convert';
import 'dart:typed_data';

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

  Future<Stream<Future<String>>> connectToDevice(
      DiscoveredDevice device) async {
    return bluetoothDriver.connectToDevice(id: device.id).map((event) async {
      List<DiscoveredService> services =
          await bluetoothDriver.discoverServices(device.id);
      Uuid charID = services[0].characteristics[0].characteristicId;
      QualifiedCharacteristic c = QualifiedCharacteristic(
          characteristicId: charID,
          serviceId: services[0].serviceId,
          deviceId: device.id);
      Future.delayed(Duration(seconds: 3));
      await bluetoothDriver.writeCharacteristicWithoutResponse(c,
          value: Uint8List.fromList(utf8.encode("1")));
      Future.delayed(Duration(seconds: 3));
      return utf8.decode(await bluetoothDriver.readCharacteristic(c));
    });
  }
}
