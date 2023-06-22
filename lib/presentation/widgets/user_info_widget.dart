// presentation/widgets/user_info_widget.dart
import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  final String userPhoto;
  final String username;
  final String userEmail;

  UserInfoWidget({
    required this.userPhoto,
    required this.username,
    required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFEF7EA),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              userPhoto,
              width: 64,
              height: 64,
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, $username',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                userEmail,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Spacer(),
          Icon(Icons.notifications),
        ],
      ),
    );
  }
}
