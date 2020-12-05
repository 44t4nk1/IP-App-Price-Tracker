import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  double _foodValue = 0;
  double _clothesValue = 0;
  double _fuelValue = 0;
  double _groceriesValue = 0;
  double _miscellaneousValue = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Theme.of(context).canvasColor,
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          "Setup",
          style: GoogleFonts.montserrat(
            fontSize: 20,
            textStyle: Theme.of(context).textTheme.headline2,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 3 / 100,
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: size.width * 5 / 100),
            width: double.infinity,
            child: Text(
              "Set your Daily Expenditiure threshold.",
              style: GoogleFonts.montserrat(
                fontSize: 16,
                textStyle: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 2 / 100,
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: size.width * 5 / 100),
                child: Text(
                  "Food",
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    textStyle: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              Spacer(),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(right: size.width * 5 / 100),
                child: Text(
                  "₹ " + _foodValue.round().toString(),
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    textStyle: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 2 / 100,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: size.width * 5 / 100, right: size.width * 5 / 100),
            child: Slider(
              activeColor: Theme.of(context).accentColor,
              inactiveColor: Theme.of(context).backgroundColor,
              value: _foodValue,
              onChanged: (newValue) {
                setState(() {
                  _foodValue = newValue;
                });
              },
              divisions: 100,
              min: 0,
              max: 20000,
            ),
          ),
        ],
      ),
    );
  }
}
