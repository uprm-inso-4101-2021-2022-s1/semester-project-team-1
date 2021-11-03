import 'package:acropolis_member_management/Widgets/ScreenSize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;

import 'AuthController.dart';

class HeightPicker extends StatefulWidget {
  @override
  _HeightPickerState createState() => _HeightPickerState();
}

class _HeightPickerState extends State<HeightPicker> {
  final AuthController authController = AuthController.to;
  void dispose() {
    // Clean up the controller when the Widget is disposed
    super.dispose();
  }

  void _showPicker(BuildContext ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              width: 200,
              height: 200,
              child: CupertinoPicker(
                backgroundColor: Colors.white,
                itemExtent: 30,
                scrollController: FixedExtentScrollController(initialItem: 60),
                children: [
                  Text('0 "'),
                  Text('1 "'),
                  Text('2 "'),
                  Text('3 "'),
                  Text('4 "'),
                  Text('5 "'),
                  Text('6 "'),
                  Text('7 "'),
                  Text('8 "'),
                  Text('9 "'),
                  Text('10 "'),
                  Text('11 "'),
                  Text('12 "'),
                  Text('13 "'),
                  Text('14 "'),
                  Text('15 "'),
                  Text('16 "'),
                  Text('17 "'),
                  Text('18 "'),
                  Text('19 "'),
                  Text('20 "'),
                  Text('21 "'),
                  Text('22 "'),
                  Text('23 "'),
                  Text('24 "'),
                  Text('25 "'),
                  Text('26 "'),
                  Text('27 "'),
                  Text('28 "'),
                  Text('29 "'),
                  Text('30 "'),
                  Text('31 "'),
                  Text('32 "'),
                  Text('33 "'),
                  Text('34 "'),
                  Text('35 "'),
                  Text('36 "'),
                  Text('37 "'),
                  Text('38 "'),
                  Text('39 "'),
                  Text('40 "'),
                  Text('41 "'),
                  Text('42 "'),
                  Text('43 "'),
                  Text('44 "'),
                  Text('45 "'),
                  Text('46 "'),
                  Text('47 "'),
                  Text('4\''),
                  Text('4\'1"'),
                  Text('4\'2"'),
                  Text('4\'3"'),
                  Text('4\'4"'),
                  Text('4\'5"'),
                  Text('4\'6"'),
                  Text('4\'7"'),
                  Text('4\'8"'),
                  Text('4\'9"'),
                  Text('4\'10"'),
                  Text('4\'11"'),
                  Text('5\''),
                  Text('5\'1"'),
                  Text('5\'2"'),
                  Text('5\'3"'),
                  Text('5\'4"'),
                  Text('5\'5"'),
                  Text('5\'6"'),
                  Text('5\'7"'),
                  Text('5\'8"'),
                  Text('5\'9"'),
                  Text('5\'10"'),
                  Text('5\'11"'),
                  Text('6\''),
                  Text('6\'1"'),
                  Text('6\'2"'),
                  Text('6\'3"'),
                  Text('6\'4"'),
                  Text('6\'5"'),
                  Text('6\'6"'),
                  Text('6\'7"'),
                  Text('6\'8"'),
                  Text('6\'9"'),
                  Text('6\'10"'),
                  Text('6\'11"'),
                  Text('7\''),
                  Text('7\'1"'),
                  Text('7\'2"'),
                  Text('7\'3"'),
                  Text('7\'4"'),
                  Text('7\'5"'),
                ],
                onSelectedItemChanged: (value) {
                  setState(() {
                    authController.heightController.text = value.toString();
                  });
                },
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 200,
        width: 200,
        child: ElevatedButton(
          style: raisedButtonStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                  const IconData(
                    0xe800,
                    fontFamily: 'heightIcon',
                  ),
                  size: 50,
                  color: Colors.white),
              SizedBox(height: screenWidth(context) * 0.035),
              Text(
                authController.heightController.text + '"',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    decoration: TextDecoration.underline),
              ),
              SizedBox(height: screenWidth(context) * 0.035),
              Text(
                'Height in inches: ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                    fontSize: 20),
              ),
            ],
          ),
          onPressed: () => _showPicker(context),
        ),
      ),
    );
  }
}

class WeightPicker extends StatefulWidget {
  @override
  _WeightPickerState createState() => _WeightPickerState();
}

class _WeightPickerState extends State<WeightPicker> {
  final AuthController authController = AuthController.to;
  void dispose() {
    // Clean up the controller when the Widget is disposed
    super.dispose();
  }

  //int selectedValue = 0;
  void _showPicker(BuildContext ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              width: 200,
              height: 200,
              child: CupertinoPicker(
                backgroundColor: Colors.white,
                itemExtent: 30,
                scrollController: FixedExtentScrollController(initialItem: 165),
                children: [
                  Text('0 lbs'),
                  Text('1 lbs'),
                  Text('2 lbs'),
                  Text('3 lbs'),
                  Text('4 lbs'),
                  Text('5 lbs'),
                  Text('6 lbs'),
                  Text('7 lbs'),
                  Text('8 lbs'),
                  Text('9 lbs'),
                  //
                  Text('10 lbs'),
                  Text('11 lbs'),
                  Text('12 lbs'),
                  Text('13 lbs'),
                  Text('14 lbs'),
                  Text('15 lbs'),
                  Text('16 lbs'),
                  Text('17 lbs'),
                  Text('18 lbs'),
                  Text('19 lbs'),
                  //
                  Text('20 lbs'),
                  Text('21 lbs'),
                  Text('22 lbs'),
                  Text('23 lbs'),
                  Text('24 lbs'),
                  Text('25 lbs'),
                  Text('26 lbs'),
                  Text('27 lbs'),
                  Text('28 lbs'),
                  Text('29 lbs'),
                  //
                  Text('30 lbs'),
                  Text('31 lbs'),
                  Text('32 lbs'),
                  Text('33 lbs'),
                  Text('34 lbs'),
                  Text('35 lbs'),
                  Text('36 lbs'),
                  Text('37 lbs'),
                  Text('38 lbs'),
                  Text('39 lbs'),
                  //
                  Text('40 lbs'),
                  Text('41 lbs'),
                  Text('42 lbs'),
                  Text('43 lbs'),
                  Text('44 lbs'),
                  Text('45 lbs'),
                  Text('46 lbs'),
                  Text('47 lbs'),
                  Text('48 lbs'),
                  Text('49 lbs'),
                  //
                  Text('50 lbs'),
                  Text('51 lbs'),
                  Text('52 lbs'),
                  Text('53 lbs'),
                  Text('54 lbs'),
                  Text('55 lbs'),
                  Text('56 lbs'),
                  Text('57 lbs'),
                  Text('58 lbs'),
                  Text('59 lbs'),
                  //
                  Text('60 lbs'),
                  Text('61 lbs'),
                  Text('62 lbs'),
                  Text('63 lbs'),
                  Text('64 lbs'),
                  Text('65 lbs'),
                  Text('66 lbs'),
                  Text('67 lbs'),
                  Text('68 lbs'),
                  Text('69 lbs'),
                  //
                  Text('70 lbs'),
                  Text('71 lbs'),
                  Text('72 lbs'),
                  Text('73 lbs'),
                  Text('74 lbs'),
                  Text('75 lbs'),
                  Text('76 lbs'),
                  Text('78 lbs'),
                  Text('77 lbs'),
                  Text('79 lbs'),
                  //
                  Text('80 lbs'),
                  Text('81 lbs'),
                  Text('82 lbs'),
                  Text('83 lbs'),
                  Text('84 lbs'),
                  Text('85 lbs'),
                  Text('86 lbs'),
                  Text('87 lbs'),
                  Text('88 lbs'),
                  Text('89 lbs'),
                  //
                  Text('90 lbs'),
                  Text('91 lbs'),
                  Text('92 lbs'),
                  Text('93 lbs'),
                  Text('94 lbs'),
                  Text('95 lbs'),
                  Text('96 lbs'),
                  Text('97 lbs'),
                  Text('98 lbs'),
                  Text('99 lbs'),
                  //
                  Text('100 lbs'),
                  Text('101 lbs'),
                  Text('102 lbs'),
                  Text('103 lbs'),
                  Text('104 lbs'),
                  Text('105 lbs'),
                  Text('106 lbs'),
                  Text('107 lbs'),
                  Text('108 lbs'),
                  Text('109 lbs'),
                  Text('110 lbs'),
                  //
                  Text('111 lbs'),
                  Text('112 lbs'),
                  Text('113 lbs'),
                  Text('114 lbs'),
                  Text('115 lbs'),
                  Text('116 lbs'),
                  Text('117 lbs'),
                  Text('118 lbs'),
                  Text('119 lbs'),
                  //
                  Text('120 lbs'),
                  Text('121 lbs'),
                  Text('122 lbs'),
                  Text('123 lbs'),
                  Text('124 lbs'),
                  Text('125 lbs'),
                  Text('126 lbs'),
                  Text('127 lbs'),
                  Text('128 lbs'),
                  Text('129 lbs'),
                  //
                  Text('130 lbs'),
                  Text('131 lbs'),
                  Text('132 lbs'),
                  Text('133 lbs'),
                  Text('134 lbs'),
                  Text('135 lbs'),
                  Text('136 lbs'),
                  Text('137 lbs'),
                  Text('138 lbs'),
                  Text('139 lbs'),
                  //
                  Text('140 lbs'),
                  Text('141 lbs'),
                  Text('142 lbs'),
                  Text('143 lbs'),
                  Text('144 lbs'),
                  Text('145 lbs'),
                  Text('146 lbs'),
                  Text('147 lbs'),
                  Text('148 lbs'),
                  Text('149 lbs'),
                  //
                  Text('150 lbs'),
                  Text('151 lbs'),
                  Text('152 lbs'),
                  Text('153 lbs'),
                  Text('154 lbs'),
                  Text('155 lbs'),
                  Text('156 lbs'),
                  Text('157 lbs'),
                  Text('158 lbs'),
                  Text('159 lbs'),
                  //
                  Text('160 lbs'),
                  Text('161 lbs'),
                  Text('162 lbs'),
                  Text('163 lbs'),
                  Text('164 lbs'),
                  Text('165 lbs'),
                  Text('166 lbs'),
                  Text('167 lbs'),
                  Text('168 lbs'),
                  Text('169 lbs'),
                  //
                  Text('170 lbs'),
                  Text('171 lbs'),
                  Text('172 lbs'),
                  Text('173 lbs'),
                  Text('174 lbs'),
                  Text('175 lbs'),
                  Text('176 lbs'),
                  Text('177 lbs'),
                  Text('178 lbs'),
                  Text('179 lbs'),
                  //
                  Text('180 lbs'),
                  Text('181 lbs'),
                  Text('182 lbs'),
                  Text('183 lbs'),
                  Text('184 lbs'),
                  Text('185 lbs'),
                  Text('186 lbs'),
                  Text('187 lbs'),
                  Text('188 lbs'),
                  Text('189 lbs'),
                  //
                  Text('190 lbs'),
                  Text('191 lbs'),
                  Text('192 lbs'),
                  Text('193 lbs'),
                  Text('194 lbs'),
                  Text('195 lbs'),
                  Text('196 lbs'),
                  Text('197 lbs'),
                  Text('198 lbs'),
                  Text('199 lbs'),
                  //
                  Text('200 lbs'),
                  Text('201 lbs'),
                  Text('202 lbs'),
                  Text('203 lbs'),
                  Text('204 lbs'),
                  Text('205 lbs'),
                  Text('206 lbs'),
                  Text('207 lbs'),
                  Text('208 lbs'),
                  Text('209 lbs'),
                  //
                  Text('210 lbs'),
                  Text('211 lbs'),
                  Text('212 lbs'),
                  Text('213 lbs'),
                  Text('214 lbs'),
                  Text('215 lbs'),
                  Text('216 lbs'),
                  Text('217 lbs'),
                  Text('218 lbs'),
                  Text('219 lbs'),
                  //
                  Text('220 lbs'),
                  Text('221 lbs'),
                  Text('222 lbs'),
                  Text('223 lbs'),
                  Text('224 lbs'),
                  Text('225 lbs'),
                  Text('226 lbs'),
                  Text('227 lbs'),
                  Text('228 lbs'),
                  Text('229 lbs'),
                  //
                  Text('230 lbs'),
                  Text('231 lbs'),
                  Text('232 lbs'),
                  Text('233 lbs'),
                  Text('234 lbs'),
                  Text('235 lbs'),
                  Text('236 lbs'),
                  Text('237 lbs'),
                  Text('238 lbs'),
                  Text('239 lbs'),
                  //
                  Text('240 lbs'),
                  Text('241 lbs'),
                  Text('242 lbs'),
                  Text('243 lbs'),
                  Text('244 lbs'),
                  Text('245 lbs'),
                  Text('246 lbs'),
                  Text('247 lbs'),
                  Text('248 lbs'),
                  Text('249 lbs'),
                  //
                  Text('250 lbs'),
                  Text('251 lbs'),
                  Text('252 lbs'),
                  Text('253 lbs'),
                  Text('254 lbs'),
                  Text('255 lbs'),
                  Text('256 lbs'),
                  Text('257 lbs'),
                  Text('258 lbs'),
                  Text('259 lbs'),
                  //
                  Text('260 lbs'),
                  Text('261 lbs'),
                  Text('262 lbs'),
                  Text('263 lbs'),
                  Text('264 lbs'),
                  Text('265 lbs'),
                  Text('266 lbs'),
                  Text('267 lbs'),
                  Text('268 lbs'),
                  Text('269 lbs'),
                  //
                  Text('270 lbs'),
                  Text('271 lbs'),
                  Text('272 lbs'),
                  Text('273 lbs'),
                  Text('274 lbs'),
                  Text('275 lbs'),
                  Text('276 lbs'),
                  Text('277 lbs'),
                  Text('278 lbs'),
                  Text('279 lbs'),

                  Text('280 lbs'),
                ],
                onSelectedItemChanged: (value) {
                  setState(() {
                    authController.initialWeightController.text =
                        value.toString();
                  });
                },
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 200,
        width: 200,
        child: ElevatedButton(
          style: raisedButtonStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: FaIcon(
                    FontAwesomeIcons.weight,
                    size: 50,
                    color: Colors.white,
                  )),
              SizedBox(height: screenWidth(context) * 0.035),
              Text(
                authController.initialWeightController.text + " lbs",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: screenWidth(context) * 0.035),
              Text(
                'Select Weight',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                    fontSize: 20),
              ),
            ],
          ),
          onPressed: () => _showPicker(context),
        ),
      ),
    );
  }
}
//bar_chart_rounded

class CurrentWeightPicker extends StatefulWidget {
  @override
  _CurrentWeightPickerState createState() => _CurrentWeightPickerState();
}

class _CurrentWeightPickerState extends State<CurrentWeightPicker> {
  final AuthController authController = AuthController.to;
  void dispose() {
    // Clean up the controller when the Widget is disposed
    super.dispose();
  }

  //int selectedValue = 0;
  void _showPicker(BuildContext ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              width: 200,
              height: 200,
              child: CupertinoPicker(
                backgroundColor: Colors.white,
                itemExtent: 30,
                scrollController: FixedExtentScrollController(initialItem: 165),
                children: [
                  Text('0 lbs'),
                  Text('1 lbs'),
                  Text('2 lbs'),
                  Text('3 lbs'),
                  Text('4 lbs'),
                  Text('5 lbs'),
                  Text('6 lbs'),
                  Text('7 lbs'),
                  Text('8 lbs'),
                  Text('9 lbs'),
                  //
                  Text('10 lbs'),
                  Text('11 lbs'),
                  Text('12 lbs'),
                  Text('13 lbs'),
                  Text('14 lbs'),
                  Text('15 lbs'),
                  Text('16 lbs'),
                  Text('17 lbs'),
                  Text('18 lbs'),
                  Text('19 lbs'),
                  //
                  Text('20 lbs'),
                  Text('21 lbs'),
                  Text('22 lbs'),
                  Text('23 lbs'),
                  Text('24 lbs'),
                  Text('25 lbs'),
                  Text('26 lbs'),
                  Text('27 lbs'),
                  Text('28 lbs'),
                  Text('29 lbs'),
                  //
                  Text('30 lbs'),
                  Text('31 lbs'),
                  Text('32 lbs'),
                  Text('33 lbs'),
                  Text('34 lbs'),
                  Text('35 lbs'),
                  Text('36 lbs'),
                  Text('37 lbs'),
                  Text('38 lbs'),
                  Text('39 lbs'),
                  //
                  Text('40 lbs'),
                  Text('41 lbs'),
                  Text('42 lbs'),
                  Text('43 lbs'),
                  Text('44 lbs'),
                  Text('45 lbs'),
                  Text('46 lbs'),
                  Text('47 lbs'),
                  Text('48 lbs'),
                  Text('49 lbs'),
                  //
                  Text('50 lbs'),
                  Text('51 lbs'),
                  Text('52 lbs'),
                  Text('53 lbs'),
                  Text('54 lbs'),
                  Text('55 lbs'),
                  Text('56 lbs'),
                  Text('57 lbs'),
                  Text('58 lbs'),
                  Text('59 lbs'),
                  //
                  Text('60 lbs'),
                  Text('61 lbs'),
                  Text('62 lbs'),
                  Text('63 lbs'),
                  Text('64 lbs'),
                  Text('65 lbs'),
                  Text('66 lbs'),
                  Text('67 lbs'),
                  Text('68 lbs'),
                  Text('69 lbs'),
                  //
                  Text('70 lbs'),
                  Text('71 lbs'),
                  Text('72 lbs'),
                  Text('73 lbs'),
                  Text('74 lbs'),
                  Text('75 lbs'),
                  Text('76 lbs'),
                  Text('78 lbs'),
                  Text('77 lbs'),
                  Text('79 lbs'),
                  //
                  Text('80 lbs'),
                  Text('81 lbs'),
                  Text('82 lbs'),
                  Text('83 lbs'),
                  Text('84 lbs'),
                  Text('85 lbs'),
                  Text('86 lbs'),
                  Text('87 lbs'),
                  Text('88 lbs'),
                  Text('89 lbs'),
                  //
                  Text('90 lbs'),
                  Text('91 lbs'),
                  Text('92 lbs'),
                  Text('93 lbs'),
                  Text('94 lbs'),
                  Text('95 lbs'),
                  Text('96 lbs'),
                  Text('97 lbs'),
                  Text('98 lbs'),
                  Text('99 lbs'),
                  //
                  Text('100 lbs'),
                  Text('101 lbs'),
                  Text('102 lbs'),
                  Text('103 lbs'),
                  Text('104 lbs'),
                  Text('105 lbs'),
                  Text('106 lbs'),
                  Text('107 lbs'),
                  Text('108 lbs'),
                  Text('109 lbs'),
                  Text('110 lbs'),
                  //
                  Text('111 lbs'),
                  Text('112 lbs'),
                  Text('113 lbs'),
                  Text('114 lbs'),
                  Text('115 lbs'),
                  Text('116 lbs'),
                  Text('117 lbs'),
                  Text('118 lbs'),
                  Text('119 lbs'),
                  //
                  Text('120 lbs'),
                  Text('121 lbs'),
                  Text('122 lbs'),
                  Text('123 lbs'),
                  Text('124 lbs'),
                  Text('125 lbs'),
                  Text('126 lbs'),
                  Text('127 lbs'),
                  Text('128 lbs'),
                  Text('129 lbs'),
                  //
                  Text('130 lbs'),
                  Text('131 lbs'),
                  Text('132 lbs'),
                  Text('133 lbs'),
                  Text('134 lbs'),
                  Text('135 lbs'),
                  Text('136 lbs'),
                  Text('137 lbs'),
                  Text('138 lbs'),
                  Text('139 lbs'),
                  //
                  Text('140 lbs'),
                  Text('141 lbs'),
                  Text('142 lbs'),
                  Text('143 lbs'),
                  Text('144 lbs'),
                  Text('145 lbs'),
                  Text('146 lbs'),
                  Text('147 lbs'),
                  Text('148 lbs'),
                  Text('149 lbs'),
                  //
                  Text('150 lbs'),
                  Text('151 lbs'),
                  Text('152 lbs'),
                  Text('153 lbs'),
                  Text('154 lbs'),
                  Text('155 lbs'),
                  Text('156 lbs'),
                  Text('157 lbs'),
                  Text('158 lbs'),
                  Text('159 lbs'),
                  //
                  Text('160 lbs'),
                  Text('161 lbs'),
                  Text('162 lbs'),
                  Text('163 lbs'),
                  Text('164 lbs'),
                  Text('165 lbs'),
                  Text('166 lbs'),
                  Text('167 lbs'),
                  Text('168 lbs'),
                  Text('169 lbs'),
                  //
                  Text('170 lbs'),
                  Text('171 lbs'),
                  Text('172 lbs'),
                  Text('173 lbs'),
                  Text('174 lbs'),
                  Text('175 lbs'),
                  Text('176 lbs'),
                  Text('177 lbs'),
                  Text('178 lbs'),
                  Text('179 lbs'),
                  //
                  Text('180 lbs'),
                  Text('181 lbs'),
                  Text('182 lbs'),
                  Text('183 lbs'),
                  Text('184 lbs'),
                  Text('185 lbs'),
                  Text('186 lbs'),
                  Text('187 lbs'),
                  Text('188 lbs'),
                  Text('189 lbs'),
                  //
                  Text('190 lbs'),
                  Text('191 lbs'),
                  Text('192 lbs'),
                  Text('193 lbs'),
                  Text('194 lbs'),
                  Text('195 lbs'),
                  Text('196 lbs'),
                  Text('197 lbs'),
                  Text('198 lbs'),
                  Text('199 lbs'),
                  //
                  Text('200 lbs'),
                  Text('201 lbs'),
                  Text('202 lbs'),
                  Text('203 lbs'),
                  Text('204 lbs'),
                  Text('205 lbs'),
                  Text('206 lbs'),
                  Text('207 lbs'),
                  Text('208 lbs'),
                  Text('209 lbs'),
                  //
                  Text('210 lbs'),
                  Text('211 lbs'),
                  Text('212 lbs'),
                  Text('213 lbs'),
                  Text('214 lbs'),
                  Text('215 lbs'),
                  Text('216 lbs'),
                  Text('217 lbs'),
                  Text('218 lbs'),
                  Text('219 lbs'),
                  //
                  Text('220 lbs'),
                  Text('221 lbs'),
                  Text('222 lbs'),
                  Text('223 lbs'),
                  Text('224 lbs'),
                  Text('225 lbs'),
                  Text('226 lbs'),
                  Text('227 lbs'),
                  Text('228 lbs'),
                  Text('229 lbs'),
                  //
                  Text('230 lbs'),
                  Text('231 lbs'),
                  Text('232 lbs'),
                  Text('233 lbs'),
                  Text('234 lbs'),
                  Text('235 lbs'),
                  Text('236 lbs'),
                  Text('237 lbs'),
                  Text('238 lbs'),
                  Text('239 lbs'),
                  //
                  Text('240 lbs'),
                  Text('241 lbs'),
                  Text('242 lbs'),
                  Text('243 lbs'),
                  Text('244 lbs'),
                  Text('245 lbs'),
                  Text('246 lbs'),
                  Text('247 lbs'),
                  Text('248 lbs'),
                  Text('249 lbs'),
                  //
                  Text('250 lbs'),
                  Text('251 lbs'),
                  Text('252 lbs'),
                  Text('253 lbs'),
                  Text('254 lbs'),
                  Text('255 lbs'),
                  Text('256 lbs'),
                  Text('257 lbs'),
                  Text('258 lbs'),
                  Text('259 lbs'),
                  //
                  Text('260 lbs'),
                  Text('261 lbs'),
                  Text('262 lbs'),
                  Text('263 lbs'),
                  Text('264 lbs'),
                  Text('265 lbs'),
                  Text('266 lbs'),
                  Text('267 lbs'),
                  Text('268 lbs'),
                  Text('269 lbs'),
                  //
                  Text('270 lbs'),
                  Text('271 lbs'),
                  Text('272 lbs'),
                  Text('273 lbs'),
                  Text('274 lbs'),
                  Text('275 lbs'),
                  Text('276 lbs'),
                  Text('277 lbs'),
                  Text('278 lbs'),
                  Text('279 lbs'),

                  Text('280 lbs'),
                ],
                onSelectedItemChanged: (value) {
                  setState(() {
                    authController.currentWeightController.text =
                        value.toString();
                  });
                },
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 200,
        width: 200,
        child: ElevatedButton(
          style: raisedButtonStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: FaIcon(
                    FontAwesomeIcons.weight,
                    size: 50,
                    color: Colors.white,
                  )),
              SizedBox(height: screenWidth(context) * 0.035),
              Text(
                authController.currentWeightController.text + " lbs",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: screenWidth(context) * 0.035),
              Text(
                'Select Weight',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                    fontSize: 20),
              ),
            ],
          ),
          onPressed: () => _showPicker(context),
        ),
      ),
    );
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.transparent,
  primary: Colors.transparent,
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    side: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.all(Radius.circular(18.0)),
  ),
);
final ButtonStyle secondRaisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.transparent,
  primary: Colors.transparent,
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    side: BorderSide(color: Colors.white54),
    borderRadius: BorderRadius.all(Radius.circular(18.0)),
  ),
);
