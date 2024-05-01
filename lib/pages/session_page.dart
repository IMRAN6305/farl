import 'package:farl/pages/context_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'data.dart';
import 'exam_page.dart';

class Session extends StatefulWidget {
  final String name;
  Session({required this.name});

  @override
  State<Session> createState() => _SessionState();
}

class _SessionState extends State<Session> {
  bool? isSessionFieldsUnlocked = false;
  bool areAllSessionFieldsUnlocked(List<dynamic> session) {
    return session.every((field) => field['lock'] == false);
  }

  void check_lock(index) {
    var session = (mdata[widget.name]!['session'] as List)
        .elementAt(index)['Session${index + 1}'] ??
        [];
    this.isSessionFieldsUnlocked = areAllSessionFieldsUnlocked(session);
  }

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
      ),
      body: Padding(
        padding: EdgeInsets.all(21.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                    flex: 9,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.0),
                        border: Border.all(color: Colors.grey, width: 2),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
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
                                    value: 70,
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
                                  )
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Divider(
                              color: Colors.grey,
                              thickness: 5,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Container(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView.builder(
                itemCount: (mdata[widget.name]?['session'] as List<dynamic>?)
                    ?.length ??
                    0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 6.0, left: 12.0),
                    child: ExpansionTile(
                      backgroundColor: Colors.white,
                      collapsedTextColor: Colors.blue,
                      collapsedBackgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(21.0),
                        side: BorderSide(color: Colors.grey, width: 2),
                      ),
                      collapsedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(21.0),
                        side: BorderSide(color: Colors.grey, width: 2),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      childrenPadding: EdgeInsets.only(
                        top: 21,
                        bottom: 12,
                        left: 12.0,
                        right: 12.0,
                      ),
                      title: Text('Session ${index + 1}'),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            child: Icon(
                              Icons.book_outlined,
                              color: Colors.blue,
                            ),
                            radius: 12.0,
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(width: 10.0),
                          CircleAvatar(
                            backgroundColor: Colors.yellow.withOpacity(0.2),
                            child: Icon(
                              Icons.tv_rounded,
                              color: Colors.yellowAccent,
                            ),
                            radius: 12.0,
                          ),
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Watch Recording',
                          style: TextStyle(color: Colors.blue),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(color: Colors.blue, width: 2),
                          ),
                        ),
                      ),
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount:
                          ((mdata[widget.name]!['session'] as List)[index]
                          ['Session${index + 1}'] as List)
                              .length,
                          itemBuilder: (context, subindex) {
                            List sessionList = ((mdata[widget.name]!['session']
                            as List)[index]['Session${index + 1}'] as List);
                            if (subindex >= sessionList.length) {
                              return SizedBox.shrink();
                            }

                            bool isLocked =
                                sessionList[subindex]['lock'] ?? true;
                            return Card(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    sessionList[subindex]['lock'] = false;
                                  });
                                  if (!isLocked) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ContextPage(
                                          heading: sessionList[subindex]
                                          ['title']
                                              .toString(),
                                        ),
                                      ),
                                    );
                                  }
                                  this.check_lock(index);
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: ListTile(
                                    leading: isLocked
                                        ? Icon(Icons.lock)
                                        : Icon(Icons.lock_open_outlined),
                                    title: Text(sessionList[subindex]['title']
                                        .toString()),
                                    trailing:
                                    Icon(Icons.arrow_forward_ios_outlined),
                                  ),
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                side: BorderSide(color: Colors.grey, width: 1),
                              ),
                              elevation: 0,
                              margin: EdgeInsets.symmetric(vertical: 8.0),
                            );
                          },
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            String selectedSprint = widget.name;
                            int selectedSession = index;
                            var session = (mdata[widget.name]!['session'] as List)
                                .elementAt(index)['Session${index + 1}'] ??
                                [];
                            bool isSessionUnlocked = areAllSessionFieldsUnlocked(session);
                            if (isSessionUnlocked) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ExamPage(
                                    sprint: selectedSprint,
                                    session: selectedSession,
                                  ),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('This session is locked.'),
                                backgroundColor: Colors.red,
                              ));
                            }
                          },
                          child: Text('Test'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: areAllSessionFieldsUnlocked((mdata[widget.name]!['session'] as List).elementAt(index)['Session${index + 1}'] ?? []) ? Colors.blue : Colors.grey,
                            foregroundColor: Colors.white,
                            fixedSize: Size(double.infinity, 50.0),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21.0)),
                          ),
                        ),

                      ],
                    ),
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
