import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Session extends StatefulWidget {
  const Session({Key? key}) : super(key: key);

  @override
  State<Session> createState() => _SessionState();
}

class _SessionState extends State<Session> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.8),
        title: Text(
          'Logo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              onTap: () {},
              child: Text(
                'Home',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              onTap: () {},
              child: Text(
                'Portfolio',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              onTap: () {},
              child: Text(
                'Leaderboard',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              onTap: () {},
              child: Text(
                'About',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(21.0),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21.0),
                          border: Border.all(color: Colors.grey, width: 2),
                        ),
                        child: Column(

                          children: [
                            SfRadialGauge(
                              axes: <RadialAxis>[
                                RadialAxis(
                                  showLabels: false,
                                  showTicks: false,
                                  startAngle: 180,
                                  endAngle: 0,
                                  radiusFactor: 0.7,
                                  canScaleToFit: true,
                                  axisLineStyle: AxisLineStyle(
                                    thickness: 0.2,
                                    color: const Color.fromARGB(30, 0, 169, 181),
                                    thicknessUnit: GaugeSizeUnit.factor,
                                    cornerStyle: CornerStyle.startCurve,
                                  ),
                                  pointers: <GaugePointer>[
                                    RangePointer(
                                      value: 70,  // Replace progressValue with your actual value
                                      width: 0.2,
                                      sizeUnit: GaugeSizeUnit.factor,
                                      cornerStyle: CornerStyle.bothCurve,
                                    ),
                                  ],
                                  annotations: <GaugeAnnotation>[
                                    GaugeAnnotation(
                                      angle: 90,
                                      positionFactor: 0.1,
                                      widget: Text(
                                        '70%',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    GaugeAnnotation(
                                      angle: 90,
                                      positionFactor: 0.3,

                                      widget: Text(
                                        'Sprint Completed',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                              child: Divider(
                                color: Colors.grey,
                                thickness: 5,
                              ),
                            ),

                          ],
                        ),
                      ),

                    ),
                    Expanded(
                      flex: 5,
                      child: Container(),
                    ),
                  ],
                )),
            Expanded(
              flex: 3,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 6.0, left: 12.0),
                    child: ExpansionTile(
                        //this is style of expansionTile
                        backgroundColor: Colors.white,
                        collapsedTextColor: Colors.blue,
                        collapsedBackgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21.0),
                          side: BorderSide(
                              color: Colors.grey,
                              width: 2,
                              strokeAlign: BorderSide.strokeAlignCenter),
                        ),
                        collapsedShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21.0),
                          side: BorderSide(
                              color: Colors.grey,
                              width: 2,
                              strokeAlign: BorderSide.strokeAlignCenter),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        childrenPadding: EdgeInsets.only(
                            top: 21, bottom: 12, left: 12.0, right: 12.0),

                        //this is expand children data
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: Icon(Icons.lock),
                                title: Text('1. Help red catch the minion pig'),
                                trailing:
                                    Icon(Icons.arrow_forward_ios_outlined),
                              ),
                            ),
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                side: BorderSide(color: Colors.grey, width: 1)),
                            elevation: 0,
                          )
                        ],
                        //After
                        title: Text('Session $index'),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              child: Icon(
                                Icons.book_outlined,
                                color: Colors.white,
                              ),
                            ),
                            CircleAvatar(
                              child: Icon(
                                Icons.book_outlined,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {},
                          child: Text('Watch Recording'),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.blue.withOpacity(0.7),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: BorderSide(
                                      color: Colors.blue, width: 2))),
                        )),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
