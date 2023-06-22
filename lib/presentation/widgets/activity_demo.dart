import 'package:flutter/material.dart';

// class ActivityDemoWidget extends StatefulWidget {
//   final List<String> activities;
//   final VoidCallback onSkip;
//   final VoidCallback onNext;
//
//   ActivityDemoWidget(
//       {required this.activities, required this.onSkip, required this.onNext});
//
//   @override
//   _ActivityDemoWidgetState createState() => _ActivityDemoWidgetState();
// }
//
// class _ActivityDemoWidgetState extends State<ActivityDemoWidget> {
//   int currentIndex = 0;
//
//   void handleSkip() {
//     setState(() {
//       currentIndex = widget.activities.length - 1; // Skip to the last activity
//       widget.onSkip();
//     });
//   }
//
//   void handleNext() {
//     if (currentIndex < widget.activities.length - 1) {
//       setState(() {
//         currentIndex++;
//         widget.onNext();
//       });
//     } else {
//       // End of activities, perform necessary actions or navigation
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             widget.activities[currentIndex],
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(height: 16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextButton(
//                 onPressed: handleSkip,
//                 child: Text('Skip'),
//               ),
//               SizedBox(width: 16),
//               ElevatedButton(
//                 onPressed: handleNext,
//                 child: Text('Next'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }


class ActivityDemoWidget extends StatefulWidget {
  final List<String> activities;
  final List<String> activityDescriptions;
  final VoidCallback onSkip;
  final VoidCallback onNext;

  ActivityDemoWidget({
    required this.activities,
    required this.activityDescriptions,
    required this.onSkip,
    required this.onNext,
  });

  @override
  _ActivityDemoWidgetState createState() => _ActivityDemoWidgetState();
}

class _ActivityDemoWidgetState extends State<ActivityDemoWidget> {
  int currentIndex = 0;

  void handleSkip() {
    setState(() {
      currentIndex = widget.activities.length - 1; // Skip to the last activity
      widget.onSkip();
    });
  }

  void handleNext() {
    if (currentIndex < widget.activities.length - 1) {
      setState(() {
        currentIndex++;
        widget.onNext();
      });
    } else {
      // End of activities, perform necessary actions or navigation
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.activityDescriptions[currentIndex],
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: handleSkip,
                child: Text('Skip'),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: handleNext,
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
