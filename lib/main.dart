import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _waistCirumferenceController =
      TextEditingController();
  int _value = 1;
  int _value1 = 1;
  int _value2 = 1;
  int _value3 = 1;
  double bmi;
  double absiResult = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MaterialApp',
        home: Scaffold(
            appBar: AppBar(
              title: Text('ABSI Calculator'),
              centerTitle: true,
              backgroundColor: Colors.blueGrey,
            ),
            body: Center(
                child: Container(
                    child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Sex", style: TextStyle(fontSize: 18)),
                    Container(
                        width: 92,
                        child: DropdownButton(
                            value: _value,
                            items: [
                              DropdownMenuItem(
                                child: Text("Male"),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text("Female"),
                                value: 2,
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _value = value;
                              });
                            }))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Age ", style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          width: 54,
                          height: 30,
                          child: TextField(
                            controller: _ageController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Text("Years", style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Height ", style: TextStyle(fontSize: 18)),
                    SizedBox(height: 45),
                    Row(
                      children: [
                        Container(
                          width: 45,
                          height: 32,
                          child: TextField(
                            controller: _heightController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Container(
                            child: DropdownButton(
                                value: _value1,
                                items: [
                                  DropdownMenuItem(
                                    child: Text("cm"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("m"),
                                    value: 2,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("in"),
                                    value: 3,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("ft"),
                                    value: 4,
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _value1 = value;
                                  });
                                })),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Weight ", style: TextStyle(fontSize: 18)),
                    Row(
                      children: [
                        Container(
                          width: 51,
                          height: 32,
                          child: TextField(
                            controller: _weightController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Container(
                            child: DropdownButton(
                                value: _value2,
                                items: [
                                  DropdownMenuItem(
                                    child: Text("kg"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("lb"),
                                    value: 2,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("st"),
                                    value: 3,
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _value2 = value;
                                  });
                                }))
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Waist Cirumference ", style: TextStyle(fontSize: 18)),
                    Row(
                      children: [
                        Container(
                          width: 45,
                          height: 32,
                          child: TextField(
                            controller: _waistCirumferenceController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Container(
                            child: DropdownButton(
                                value: _value3,
                                items: [
                                  DropdownMenuItem(
                                    child: Text("cm"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("m"),
                                    value: 2,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("in"),
                                    value: 3,
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _value3 = value;
                                  });
                                }))
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  // ignore: deprecated_member_use
                  RaisedButton(
                    color: Colors.blueGrey[400],
                    child: Text(
                      "Calculate",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: calculateABSI,
                  ),
                ]),
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child:
                        Text(" Result", style: TextStyle(fontSize: 20)),
                        width:320,
                        height: 35,
                        color: Colors.blueGrey[300],
                      )
                    ]),
                SizedBox(height: 5),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(" ABSI ", style: TextStyle(fontSize: 20)),
                        width: 220,
                        height: 35,
                        color: Colors.blueGrey[100],
                      ),
                      Container(
                        child: Text(absiResult.toStringAsFixed(5),
                            style: TextStyle(fontSize: 20)),
                        width: 100,
                        height: 35,
                        color: Colors.blueGrey[100],
                      )
                    ]),
                SizedBox(height: 10),
              ],
            )))));
  }

  void calculateABSI() {
    setState(() {
      double height = double.parse(_heightController.text);
      double weight = double.parse(_weightController.text);
      double wc = double.parse(_waistCirumferenceController.text);
      if (_value1 == 1) {
        height = height / 100;
      } else if (_value1 == 3) {
        height = height / 39.37;
      } else if (_value1 == 4) {
        height = height / 3.281;
      }
      if (_value2 == 2) {
        weight = weight / 2.205;
      } else if (_value2 == 3) {
        weight = weight / 0.157;
      }
      if (_value3 == 1) {
        wc = wc / 100;
      } else if (_value3 == 3) {
        wc = wc / 39.37;
      }
      bmi = weight / (height * height);
      absiResult = wc / (pow(bmi, 2 / 3) * pow(height, 1 / 2));
      print(absiResult);
    });
  }
}
