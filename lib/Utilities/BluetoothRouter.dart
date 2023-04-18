import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class BluetoothRouter {
  final FlutterReactiveBle bluetoothDriver = FlutterReactiveBle();

  Stream<String> getNearbyDevices() {
    return bluetoothDriver.scanForDevices(
        withServices: [], scanMode: ScanMode.lowLatency).map((device) => device.name);
  }
}
