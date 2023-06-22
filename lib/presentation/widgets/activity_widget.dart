// presentation/widgets/activity_widgets.dart
import 'package:flutter/material.dart';
import 'package:userdasboard/presentation/widgets/activity_demo.dart';
import '../../data/activity_list.dart';

class ActivityWidgets extends StatelessWidget {

  void handleSkip() {
    print('Skip button pressed');
  }

  void handleNext() {
    print('Next button pressed');
  }

  final List<String> activities = [
    'Organization',
    'Field Agents',
    'Field Tools',
    'Soil Sampling',
    'Plants Database',
    'Field Measures',
    'Farm Probe',
    'Farm Manager',
    'Farm Sense',
  ];

  final List<Color> randomColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
      ),
      itemCount: activities.length,
      itemBuilder: (BuildContext context, int index) {
        final activity = activities[index];
        final randomColor = randomColors[index % randomColors.length];

        return Column(
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: ActivityDemoWidget(
                        activities: activities,
                        activityDescriptions: activityDescriptions,
                        onSkip: () {
                          Navigator.of(context).pop();
                        },
                        onNext: () {},
                      ),
                    );
                  },
                );
              },
              child: Container(
                width: 104,
                height: 78,
                color: randomColor,
                child: Center(
                  child: Image.asset(
                    'assets/images/weather.png', // Replace with your image asset path
                    width: 48,
                    height: 48,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              activity,
              style: TextStyle(fontSize: 10),
            ),
          ],
        );
      },
    );
  }
}




