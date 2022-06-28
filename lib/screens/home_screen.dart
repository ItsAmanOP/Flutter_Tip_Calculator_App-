import 'package:flutter/material.dart';
import 'package:flutter_tip_calculator/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tipPrecentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;
  Color _purple = kPurpleColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tip Calculator"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: _purple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Total Per Person',
                      style: kPurpleBoldTextStyle.copyWith(
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '\$${caclulateTotalPerPerson(_billAmount, _personCounter, _tipPrecentage).toStringAsFixed(2)}',
                      style: kPurpleBoldTextStyle.copyWith(fontSize: 35.0),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                    color: Colors.blueGrey[100], style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: _purple),
                    decoration: InputDecoration(
                        hintText: "Bill Amount",
                        prefixIcon: Icon(Icons.attach_money)),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch (exception) {
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Split",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Row(
                        children: <Widget>[
                          buildPlusMinusButton(decrement, '-'),
                          Text(
                            '$_personCounter',
                            style: kPurpleBoldTextStyle,
                          ),
                          buildPlusMinusButton(increment, '+'),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Tip',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          '\$${calculateTotalTip(_billAmount, _personCounter, _tipPrecentage).toStringAsFixed(2)}',
                          style: kPurpleBoldTextStyle,
                        ),
                      )
                    ],
                  ),
                  //Slider
                  Column(
                    children: <Widget>[
                      Text(
                        '$_tipPrecentage%',
                        style: kPurpleBoldTextStyle,
                      ),
                      Slider(
                        min: 0.0,
                        max: 100.0,
                        divisions: 10,
                        activeColor: kPurpleColor,
                        inactiveColor: Colors.black54,
                        value: _tipPrecentage.toDouble(),
                        onChanged: (double value) {
                          setState(() {
                            _tipPrecentage = value.round();
                          });
                        },
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void decrement() {
    setState(() {
      if (_personCounter > 1) {
        _personCounter--;
      } else {
        //do nothing
      }
    });
  }

  void increment() {
    setState(() {
      _personCounter++;
    });
  }

  double caclulateTotalPerPerson(
      double billAmount, int splitBy, int tipPrecentage) {
    var totalPerPerson =
        (calculateTotalTip(billAmount, splitBy, tipPrecentage) + billAmount) /
            splitBy;
    return totalPerPerson;
  }

  double calculateTotalTip(double billAmount, int splitBy, int tipPrecentage) {
    double totalTip = 0.0;
    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
      //
    } else {
      totalTip = (billAmount * tipPrecentage) / 100;
    }
    return totalTip;
  }

  InkWell buildPlusMinusButton(Function onTap, String sign) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40.0,
        height: 40.0,
        margin: const EdgeInsets.all(10.0),
        decoration: kMinusPlusButtonsBoxDecoration,
        child: Center(
          child: Text(
            sign,
            style: kPurpleBoldTextStyle,
          ),
        ),
      ),
    );
  }
}
