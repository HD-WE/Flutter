import 'dart:async';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:mongsil/ChildPage/Bluetooth/model/sensor_data.dart';

class DeviceScanner {
  Timer _timer;
  StreamController<SensorData> _streamController = new StreamController();
  Stream<SensorData> get sensorData => _streamController.stream;

  DeviceScanner() {
    _subscribeToScanEvents();
    _timer = new Timer.periodic(const Duration(seconds: 10), startScan);
  }

  void startScan(Timer timer) {
    FlutterBlue.instance.startScan(timeout: Duration(seconds: 2));
  }

  void dispose() {
    _timer.cancel();
    _streamController.close();
  }

  void _subscribeToScanEvents() {
    FlutterBlue.instance.scanResults.listen((scanResults) {
      for (ScanResult scanResult in scanResults) {
        if (scanResult.device.name.toString() == "nrf52840.ru") {
          final String data = (scanResult
                      .advertisementData.manufacturerData[256][0] +
                  scanResult.advertisementData.manufacturerData[256][6] * 0.01)
              as String;

          final SensorData sensorData = new SensorData(
            name: data,
          );
          _streamController.add(sensorData);
          FlutterBlue.instance.stopScan();
        }
      }
    });
  }
}
