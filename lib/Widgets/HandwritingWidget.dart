// import 'package:flutter/material.dart';

// class HandwritingCanvas extends StatefulWidget {
//   final Function(List<Offset>) onDrawingComplete;

//   const HandwritingCanvas({required this.onDrawingComplete, Key? key})
//       : super(key: key);

//   @override
//   _HandwritingCanvasState createState() => _HandwritingCanvasState();
// }

// class _HandwritingCanvasState extends State<HandwritingCanvas> {
//   List<Offset> _points = [];

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onPanUpdate: (details) {
//         setState(() {
//           _points.add(details.localPosition);
//         });
//       },
//       onPanEnd: (details) {
//         widget.onDrawingComplete(_points);
//         _points = [];
//       },
//       child: CustomPaint(
//         painter: HandwritingPainter(_points),
//         child: Container(height: 300, color: Colors.white),
//       ),
//     );
//   }
// }

// class HandwritingPainter extends CustomPainter {
//   final List<Offset> points;
//   HandwritingPainter(this.points);

//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.black
//       ..strokeWidth = 4.0
//       ..strokeCap = StrokeCap.round;

//     for (int i = 0; i < points.length - 1; i++) {
//       if (points[i] != Offset.zero && points[i + 1] != Offset.zero) {
//         canvas.drawLine(points[i], points[i + 1], paint);
//       }
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }

import 'package:flutter/material.dart';

class HandwritingCanvas extends StatefulWidget {
  final Function(List<Offset>) onDrawingComplete;

  const HandwritingCanvas({required this.onDrawingComplete, Key? key})
      : super(key: key);

  @override
  _HandwritingCanvasState createState() => _HandwritingCanvasState();
}

class _HandwritingCanvasState extends State<HandwritingCanvas> {
  List<Offset> _points = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _points.add(details.localPosition);
        });
      },
      onPanEnd: (details) {
        widget.onDrawingComplete(_points);
        _points = [];
      },
      child: CustomPaint(
        painter: HandwritingPainter(_points),
        child: Container(height: 300, color: Colors.white),
      ),
    );
  }
}

class HandwritingPainter extends CustomPainter {
  final List<Offset> points;
  HandwritingPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != Offset.zero && points[i + 1] != Offset.zero) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
