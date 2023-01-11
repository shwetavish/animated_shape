import 'package:animated_shape/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CircularChart extends StatelessWidget {
  const CircularChart({Key? key, required this.progress}) : super(key: key);

  final double progress;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 330,
            height: 330,
            child: SfRadialGauge(
              enableLoadingAnimation: true,
              animationDuration: 3500,
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 100,
                  showLabels: false,
                  showTicks: false,
                  startAngle: 90,
                  endAngle: 450,
                  /*ranges: [
                    GaugeRange(
                      startValue: 0,
                      endValue: progress,
                      // color: Colors.green,
                      // rangeOffset: 8,
                      startWidth: 50,
                      endWidth: 50,
                      gradient: const SweepGradient(
                        colors: <Color>[
                          Color(0xFFF5F5F5),
                          Color(0xFFFDE1D7),
                        ],
                        stops: <double>[0.25, 0.75],
                      ),
                    ),
                  ],*/
                  axisLineStyle: const AxisLineStyle(
                    thickness: 0.4,
                    // cornerStyle: CornerStyle.bothFlat,
                    color: myRed,
                    // color: Colors.blue,
                    thicknessUnit: GaugeSizeUnit.factor,
                    gradient: SweepGradient(
                      // colors: <Color>[Colors.black38, Color(0xFFD70026)],
                      colors: <Color>[
                        bgChartGradientColor1,
                        bgChartGradientColor2,
                        // Color.fromRGBO(220, 220, 220, 0.27),
                        // Color.fromRGBO(253, 225, 215, 0.29),
                        // Color.fromRGBO(199, 224, 248, 0.29), //Blue
                      ],
                      stops: <double>[0.25, 0.95],
                    ),
                  ),
                  pointers: <GaugePointer>[
                    RangePointer(
                      enableAnimation: true,
                      pointerOffset: -0.08,
                      value: progress,
                      width: 0.08,
                      sizeUnit: GaugeSizeUnit.factor,
                      gradient: const SweepGradient(
                        colors: <Color>[
                          chartBorderRingColor1,
                          chartBorderRingColor2,
                          // Color.fromRGBO(0, 0, 0, 0.1),
                          // Color.fromRGBO(215, 0, 38, 1),
                          // Color.fromRGBO(53, 150, 243, 1),
                        ],
                        stops: <double>[
                          0.25,
                          0.75,
                        ],
                      ),
                    ),
                    RangePointer(
                      enableAnimation: true,
                      value: progress,
                      width: 50,
                      gradient: const SweepGradient(
                        colors: <Color>[
                          chartGradientColor1,
                          chartGradientColor2,
                          // Color(0xFFF9FCFF),
                          // Color(0xFFC3DFF5),
                        ],
                        stops: <double>[0.25, 0.75],
                      ),
                    ),
                    MarkerPointer(
                      enableAnimation: true,
                      value: progress,
                      markerHeight: 14,
                      markerWidth: 14,
                      markerOffset: -37,
                      markerType: MarkerType.circle,
                      color: white,
                      borderWidth: 5,
                      borderColor: myRed,
                      // borderColor: Colors.blue,
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: 220,
            height: 220,
            decoration: const BoxDecoration(
              color: white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 24.0,
                  spreadRadius: 0.15,
                  color: boxShadowColor,
                ),
              ],
            ),
            child: Center(
                child: Text(
              progress.round().toString(),
              style: const TextStyle(fontSize: 26),
            )),
          ),
        ],
      ),
    );
  }
}
