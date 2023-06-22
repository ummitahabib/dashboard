import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'dart:math';

import 'package:userdasboard/presentation/widgets/activity_widget.dart';

import 'nav_bar.dart';

class ActivityDemoWidget extends StatefulWidget {
  final List<String> activities;
  final VoidCallback onSkip;
  final VoidCallback onNext;

  ActivityDemoWidget(
      {required this.activities, required this.onSkip, required this.onNext});

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
            widget.activities[currentIndex],
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

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool showActivityDemo = true;

  List<String> activityDescriptions = [
    "An organization here refers to sub farms you may have across the country. For example, if you have farms located across 3 states in Nigeria, you will need to create 3 separate organizations to reflect this.",
    "Field Agents: are people you assign to your organizations to help you manage your farm.",
    "Field Tool: An organization here refers to sub farms you may have across the country. For example, if you have farms located across 3 states in Nigeria, you will need to create 3 separate organizations to reflect this.",
    "Soil Sampling\nHere you can view results of soil sampling missions carried out on your farm and also request and schedule for soil sampling missions you want to be carried out on your farm.",
    "Plant Database\nHere you can browse through the list of plants and or crops in our database.",
    "Field Measure\nThis tool allows you to measure your farmland accurately and export the generated map. It is a paid-for feature.",
    "Farm Probe\nFarm Probe provides you with a range of tools and resources to help you monitor the performance of your farm in real-time. COMING SOON",
    "Farm Manager\nFarm Manager is a tool to help farmers and Agri-business stakeholders keep track of everything going on in their farm. This feature allows one to keep inventory and keep track of assets and materials used on their farms. This is a paid-for feature.",
    "Farm Sense\nAn organization here refers to sub farms you may have across the country. For example, if you have farms located across 3 states in Nigeria, you will need to create 3 separate organizations to reflect this.",
  ];

  void handleSkipActivityDemo() {
    setState(() {
      showActivityDemo = false;
    });
  }

  void handleNextActivityDemo() {
    // Perform any necessary logic when moving to the next activity demo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Dashboard'),
      ),
      body: ListView(
        children: [
          Container(
            color: Color(0xFFFEF7EA),
            height: 32,
            child: const HomeMarquee(),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      'assets/images/weather.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Hello User',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'user@example.com',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'What would you like to do today?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16),
          ActivityWidgets(),
          NavigationBar(destinations: [
            HomeScreen(),
            NewsScreen(),
            SocialScreen(),
            ProfileScreen(),
          ]),
        ],
      ),
    );
  }
}

class HomeMarquee extends StatelessWidget {
  const HomeMarquee({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Marquee(
      text: 'Welcome to the User Dashboard!',
      scrollAxis: Axis.horizontal,
      blankSpace: 20.0,
      velocity: 100.0,
      pauseAfterRound: Duration(seconds: 1),
      showFadingOnlyWhenScrolling: true,
      fadingEdgeStartFraction: 0.1,
      fadingEdgeEndFraction: 0.1,
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}
