import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:location_permissions/location_permissions.dart';

//https://github.com/PhilipsHue/flutter_reactive_ble/tree/master/example
//https://www.ubiqueiot.com/posts/flutter-reactive-ble
//
// class DevicesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Text("Found Devices"),
//           StreamBuilder(
//               stream: BluetoothRouter().getNearbyDevices(),
//               builder: (context, snapshot) {
//                 print(snapshot.data);
//                 return Text(snapshot.data ?? "");
//               })
//         ],
//       ),
//     );
//   }
// }

void main() {
  return runApp(
    const MaterialApp(home: DevicesPage()),
  );
}

class DevicesPage extends StatefulWidget {
  const DevicesPage({Key? key}) : super(key: key);

  @override
  _DevicesPageState createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  // Some state management stuff
  bool _foundDeviceWaitingToConnect = false;
  bool _scanStarted = false;
  bool _connected = false;
// Bluetooth related variables
  late DiscoveredDevice _ubiqueDevice;
  final flutterReactiveBle = FlutterReactiveBle();
  late StreamSubscription<DiscoveredDevice> _scanStream;
  late QualifiedCharacteristic _rxCharacteristic;
// These are the UUIDs of your device
  final Uuid serviceUuid = Uuid.parse("75C276C3-8F97-20BC-A143-B354244886D4");
  final Uuid characteristicUuid =
      Uuid.parse("6ACF4F08-CC9D-D495-6B41-AA7E60C4E8A6");

  void _startScan() async {
// Platform permissions handling stuff
    bool permGranted = false;
    setState(() {
      _scanStarted = true;
    });
    PermissionStatus permission;
    if (Platform.isAndroid) {
      permission = await LocationPermissions().requestPermissions();
      if (permission == PermissionStatus.granted) permGranted = true;
    } else if (Platform.isIOS) {
      permGranted = true;
    }
// Main scanning logic happens here ⤵️
    if (permGranted) {
      _scanStream = flutterReactiveBle
          .scanForDevices(withServices: [serviceUuid]).listen((device) {
        // Change this string to what you defined in Zephyr
        if (device.name == 'UBIQUE') {
          setState(() {
            _ubiqueDevice = device;
            _foundDeviceWaitingToConnect = true;
          });
        }
      });
    }
  }

  void _connectToDevice() {
    // We're done scanning, we can cancel it
    _scanStream.cancel();
    // Let's listen to our connection so we can make updates on a state change
    Stream<ConnectionStateUpdate> _currentConnectionStream = flutterReactiveBle
        .connectToAdvertisingDevice(
            id: _ubiqueDevice.id,
            prescanDuration: const Duration(seconds: 1),
            withServices: [serviceUuid, characteristicUuid]);
    _currentConnectionStream.listen((event) {
      switch (event.connectionState) {
        // We're connected and good to go!
        case DeviceConnectionState.connected:
          {
            _rxCharacteristic = QualifiedCharacteristic(
                serviceId: serviceUuid,
                characteristicId: characteristicUuid,
                deviceId: event.deviceId);
            setState(() {
              _foundDeviceWaitingToConnect = false;
              _connected = true;
            });
            break;
          }
        // Can add various state state updates on disconnect
        case DeviceConnectionState.disconnected:
          {
            break;
          }
        default:
      }
    });
  }

  void _partyTime() {
    if (_connected) {
      flutterReactiveBle
          .writeCharacteristicWithResponse(_rxCharacteristic, value: [
        0xff,
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(),
      persistentFooterButtons: [
        // We want to enable this button if the scan has NOT started
        // If the scan HAS started, it should be disabled.
        _scanStarted
            // True condition
            ? ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // background
                  foregroundColor: Colors.white, // foreground
                ),
                onPressed: () {},
                child: const Icon(Icons.search),
              )
            // False condition
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // background
                  foregroundColor: Colors.white, // foreground
                ),
                onPressed: _startScan,
                child: const Icon(Icons.search),
              ),
        _foundDeviceWaitingToConnect
            // True condition
            ? ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // background
                  foregroundColor: Colors.white, // foreground
                ),
                onPressed: _connectToDevice,
                child: const Icon(Icons.bluetooth),
              )
            // False condition
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey, // background
                  foregroundColor: Colors.white, // foreground
                ),
                onPressed: () {},
                child: const Icon(Icons.bluetooth),
              ),
        _connected
            // True condition
            ? ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey, // background
                  foregroundColor: Colors.white, // foreground
                ),
                onPressed: _partyTime,
                child: const Icon(Icons.celebration_rounded),
              )
            // False condition
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey, // background
                  foregroundColor: Colors.white, // foreground
                ),
                onPressed: () {},
                child: const Icon(Icons.celebration_rounded),
              ),
      ],
    );
  }
}
