import 'package:flutter/material.dart';
import 'package:mongsil/widgets/sensor_view.dart';

import 'package:mongsil/device/device_scanner.dart';

class SensorListScreen extends StatefulWidget {
  @override
  _SensorListScreenState createState() => _SensorListScreenState();
}

class _SensorListScreenState extends State<SensorListScreen> {
  final DeviceScanner deviceScanner = new DeviceScanner();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    deviceScanner.dispose();
    super.dispose();
  }

  static const String _title = 'Arduino Sensor Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: StreamBuilder(
          stream: deviceScanner.sensorData,
          builder: (context, data) {
            if (data.data == null) {
              return Center(
                child: Text("No sensor found yet"),
              );
            }
            return SensorView(data.data);
          },
        ),
      ),
    );
  }
}
