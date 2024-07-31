import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Temp extends StatelessWidget {
  final double temperature;
  final double humidity;

  const Temp({Key? key, required this.temperature, required this.humidity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Medidor de Temperatura
        Container(
          width: 200,
          height: 200,
          child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                minimum: -10,
                maximum: 50,
                ranges: <GaugeRange>[
                  GaugeRange(startValue: -10, endValue: 0, color: Colors.blue),
                  GaugeRange(startValue: 0, endValue: 30, color: Colors.green),
                  GaugeRange(startValue: 30, endValue: 50, color: Colors.red),
                ],
                pointers: <GaugePointer>[
                  NeedlePointer(value: temperature),
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    widget: Container(
                      child: Text(
                        '$temperature°C',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    angle: 90,
                    positionFactor: 0.5,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        // Medidor de Humedad
        Container(
          width: 200,
          height: 200,
          child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: 100,
                ranges: <GaugeRange>[
                  GaugeRange(startValue: 0, endValue: 50, color: Colors.yellow),
                  GaugeRange(startValue: 50, endValue: 75, color: Colors.purple),
                  GaugeRange(startValue: 75, endValue: 100, color: Colors.red),
                ],
                pointers: <GaugePointer>[
                  NeedlePointer(value: humidity),
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    widget: Container(
                      child: Text(
                        '$humidity%',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    angle: 90,
                    positionFactor: 0.5,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
