import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override  void initState() {
   Timer.periodic(Duration(seconds:1),(timer){
  setState(() {
  });
} );
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
        height: 300,
        child: Transform.rotate(angle: -pi/2,
        child: CustomPaint(
          painter: ClockPainter(),
         ),
    ));
   }
}


class ClockPainter extends CustomPainter
{
  var dateTime = DateTime.now();

@override
  void paint(Canvas canvas, Size size) {
  var centerX = size.width / 2;
  var centerY = size.height / 2;
  var center = Offset(centerX, centerY);
  var radius = min(centerX, centerY);

  var fillBrush = Paint()
  ..color = Color(0xFF444974);

  var outlineBrush = Paint()
    ..color = Color(0xFFEAECFF)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 16;

  var centerFillBrush = Paint()
    ..color = Color(0xFFEAECFF);

  var secHandBrush = Paint()
    ..color = Colors.orange[300]
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 8;

  var minHandBrush = Paint()
    ..shader = RadialGradient(colors: [Color(0xFF748EF6), Color(0xFF77DDFF)]).createShader(Rect.fromCircle(center: center, radius: radius))
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 16;

  var hourHandBrush = Paint()
    ..shader = RadialGradient(colors: [Color(0xFEA74AB), Color(0xFFC279FB)]).createShader(Rect.fromCircle(center: center, radius: radius))
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 16;


  canvas.drawCircle(center, radius -40, fillBrush);
  canvas.drawCircle(center, radius -40, outlineBrush);

  var hourHandX = centerX + 60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi/180);
  var hourHandY = centerX + 60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi/180);
  canvas.drawLine(center, Offset(hourHandX,hourHandY), hourHandBrush);

  var minHandX =  centerX + 80 * cos(dateTime.minute * 6 * pi/180);
  var minHandY = centerX +  80 * sin (dateTime.minute * 6 * pi/180);
  canvas.drawLine(center, Offset(minHandX,minHandY), minHandBrush);

  var secHandX = centerX +  80 * cos(dateTime.second * 6 * pi/180);
  var secHandY = centerX +  80 * sin(dateTime.second * 6 * pi/180);
  canvas.drawLine(center, Offset(secHandX,secHandY), secHandBrush);

  canvas.drawCircle(center, 16, centerFillBrush);
}
@override
  bool shouldRepaint(CustomPainter oldDelegate){
  return true;
}
}
