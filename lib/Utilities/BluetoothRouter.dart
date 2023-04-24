import 'dart:collection';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class BluetoothRouter {
  final FlutterReactiveBle bluetoothDriver = FlutterReactiveBle();

  Stream<Map<String, DiscoveredDevice>> getNearbyDevices() {
    Map<String, DiscoveredDevice> devices = new Map<String, DiscoveredDevice>();
    return bluetoothDriver.scanForDevices(
        withServices: [], scanMode: ScanMode.lowLatency).map((event) {
      devices[event.id] = event;
      return devices;
    });
  }
}
