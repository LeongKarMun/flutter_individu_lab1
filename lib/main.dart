import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_individu_lab1/absi_data.dart';

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
  double _absiMean = 0.0;
  double _absiSD = 0.0;
  double _absiZscore = 0.0;
  AbsiData _absiData = AbsiData();
  String _result = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MaterialApp',
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text('ABSI Calculator'),
              centerTitle: true,
              backgroundColor: Colors.blueGrey,
            ),
            body: Center(
                child: Container(
                    width: 380,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Sex", style: TextStyle(fontSize: 18)),
                            Container(
                                width: 120,
                                padding: EdgeInsets.all(1.0),
                                child: DropdownButton(
                                    value: _value,
                                    items: [
                                      DropdownMenuItem(
                                        child: Center(
                                          child: Text("Male"),
                                        ),
                                        value: 1,
                                      ),
                                      DropdownMenuItem(
                                        child: Center(
                                          child: Text("Female"),
                                        ),
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
                            Text("Age", style: TextStyle(fontSize: 18)),
                            Row(
                              children: [
                                Container(
                                  width: 70,
                                  padding: EdgeInsets.all(1.0),
                                  child: TextField(
                                    controller: _ageController,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center
                                  ),
                                ),
                                Container(
                                  width: 70,
                                  child: Text("Years",
                                      style: TextStyle(fontSize: 17)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Height ", style: TextStyle(fontSize: 18)),
                            Row(
                              children: [
                                Container(
                                  width: 70,
                                  child: TextField(
                                    controller: _heightController,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center
                                  ),
                                ),
                                Container(
                                    width: 70,
                                    padding: EdgeInsets.all(1.0),
                                    child: DropdownButton(
                                        value: _value1,
                                        items: [
                                          DropdownMenuItem(
                                            child: Center(
                                              child: Text("cm"),
                                            ),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: Center(
                                              child: Text("m"),
                                            ),
                                            value: 2,
                                          ),
                                          DropdownMenuItem(
                                            child: Center(
                                              child: Text("in"),
                                            ),
                                            value: 3,
                                          ),
                                          DropdownMenuItem(
                                            child: Center(
                                              child: Text("ft"),
                                            ),
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
                            Text("Weight", style: TextStyle(fontSize: 18)),
                            Row(
                              children: [
                                Container(
                                  width: 70,
                                  child: TextField(
                                    controller: _weightController,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center
                                  ),
                                ),
                                Container(
                                    width: 70,
                                    padding: EdgeInsets.all(1.0),
                                    child: DropdownButton(
                                        value: _value2,
                                        items: [
                                          DropdownMenuItem(
                                            child: Center(
                                              child: Text("kg"),
                                            ),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: Center(
                                              child: Text("lb"),
                                            ),
                                            value: 2,
                                          ),
                                          DropdownMenuItem(
                                            child: Center(
                                              child: Text("st"),
                                            ),
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
                            Text("Waist Cirumference",
                                style: TextStyle(fontSize: 18)),
                            Row(
                              children: [
                                Container(
                                  width: 70,
                                  child: TextField(
                                    controller: _waistCirumferenceController,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center
                                  ),
                                ),
                                Container(
                                    width: 70,
                                    padding: EdgeInsets.all(1.0),
                                    child: DropdownButton(
                                        value: _value3,
                                        items: [
                                          DropdownMenuItem(
                                            child: Center(
                                              child: Text("cm"),
                                            ),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: Center(
                                              child: Text("m"),
                                            ),
                                            value: 2,
                                          ),
                                          DropdownMenuItem(
                                            child: Center(
                                              child: Text("in"),
                                            ),
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
                        SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 200,
                                height: 50,
                                child:
                                    // ignore: deprecated_member_use
                                    RaisedButton(
                                  color: Colors.blueGrey[400],
                                  child: Text(
                                    "Calculate",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: calculate,
                                ),
                              ),
                            ]),
                        SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text("Results",
                                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                                width: 380,
                                height: 35,
                                color: Colors.blueGrey[300],
                              )
                            ]),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text("ABSI",
                                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                                width: 220,
                                height: 30,
                                color: Colors.blueGrey[100],
                              ),
                              Container(
                                child: Text(absiResult.toStringAsFixed(5),
                                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                                width: 160,
                                height: 30,
                                color: Colors.blueGrey[100],
                              ),
                            ]),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text("ABSI z-score",
                                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                                width: 220,
                                height: 30,
                                color: Colors.blueGrey[100],
                              ),
                              Container(
                                child: Text(_absiZscore.toStringAsFixed(5),
                                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                                width: 160,
                                height: 30,
                                color: Colors.blueGrey[100],
                              ),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(_result, style: TextStyle(fontSize: 18),textAlign: TextAlign.center),
                                width: 380,
                                height: 50,
                                color: Colors.blueGrey[100],
                              ),
                            ]),
                      ],
                    ))))

                    );
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

  void calculateABSIzScore() {
    getABSIData();
    _absiZscore = (absiResult - _absiMean) / _absiSD;
    print(_absiZscore);
  }

  void getABSIData() {
    var data = [];
    int age = int.parse(_ageController.text);
    if (_value == 1) {
      data = _absiData.dataMale;
      data.forEach((element) {
        if (age == int.parse(element['name'])) {
          _absiMean = double.parse(element['values']['ABSIMean']);
          _absiSD = double.parse(element['values']['ABSISD']);
        }
      });
    } else {
      data = _absiData.dataFemale;
      data.forEach((element) {
        if (age == int.parse(element['name'])) {
          _absiMean = double.parse(element['values']['ABSIMean']);
          _absiSD = double.parse(element['values']['ABSISD']);
        }
      });
    }
  }

  void zScoreResult() {
    calculateABSIzScore();
    if (_absiZscore < -0.868) {
      _result = 'According to your ABSI z score,' + '\n your premature mortality risk is very low!👌';
    } else if (_absiZscore >= -0.868 && _absiZscore < -0.272) {
      _result = 'According to your ABSI z score,' + '\n your premature mortality risk is low!👍';
    } else if (_absiZscore >= -0.272 && _absiZscore < 0.229) {
      _result = 'According to your ABSI z score, ' + '\nyour premature mortality risk is average✔️';
    } else if (_absiZscore >= 0.229 && _absiZscore < 0.798) {
      _result = 'According to your ABSI z score,' + '\n your premature mortality risk is high❗';
    } else if (_absiZscore >= 0.798) { 
      _result = 'According to your ABSI z score,' + '\n your premature mortality risk is very high❗❗❗';
    }
  }

  void calculate() {
    calculateABSI();
    calculateABSIzScore();
    zScoreResult();
  }
}
